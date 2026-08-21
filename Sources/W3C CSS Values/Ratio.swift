import Format_Primitives

public struct Ratio: Sendable, Hashable, Comparable {

    public let width: Double

    public let height: Double

    public init(_ width: Double, _ height: Double) throws(RatioError) {
        guard width >= 0 else {
            throw RatioError.invalidValue("Width component of ratio must be positive, got \(width)")
        }
        guard height >= 0 else {
            throw RatioError.invalidValue(
                "Height component of ratio must be positive, got \(height)"
            )
        }
        self.width = width
        self.height = height
    }

    public init(_ width: Int, _ height: Int) throws(RatioError) {
        try self.init(Double(width), Double(height))
    }

    public init(_ value: Double) throws(RatioError) {
        try self.init(value, 1)
    }

    public init(_ value: Int) throws(RatioError) {
        try self.init(Double(value))
    }
}

extension Ratio {

    public enum RatioError: Swift.Error, Sendable {
        case invalidValue(String)
    }

    public var quotient: Double {
        return width / height
    }

    public static let square = try! Ratio(1, 1)

    public static let tv = try! Ratio(4, 3)

    public static let widescreen = try! Ratio(16, 9)

    public static let ultrawide = try! Ratio(21, 9)

    public static let movie = try! Ratio(185, 100)

    public static let cinemascope = try! Ratio(239, 100)

}

extension Ratio: CustomStringConvertible {

    public var description: String {

        if height == 1 {
            return width.formatted(.number)
        } else {
            return "\(width.formatted(.number)) / \(height.formatted(.number))"
        }
    }
}

extension Ratio: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {

        try! self.init(value)
    }
}

extension Ratio: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {

        try! self.init(value)
    }
}

extension Ratio {

    public static func < (lhs: Ratio, rhs: Ratio) -> Bool {
        return lhs.quotient < rhs.quotient
    }

    public var inverse: Ratio {

        return try! Ratio(height, width)
    }

    public func simplified() -> Ratio {
        func gcd(_ a: Double, _ b: Double) -> Double {
            let epsilon = 1e-10

            let isWhole =
                a.truncatingRemainder(dividingBy: 1) < epsilon
                && b.truncatingRemainder(dividingBy: 1) < epsilon

            if isWhole {
                let intA = Int(a.rounded())
                let intB = Int(b.rounded())

                func gcdInt(_ a: Int, _ b: Int) -> Int {
                    return b == 0 ? a : gcdInt(b, a % b)
                }

                return Double(gcdInt(intA, intB))
            }

            return 1.0
        }

        let divisor = gcd(width, height)

        return try! Ratio(width / divisor, height / divisor)
    }
}
