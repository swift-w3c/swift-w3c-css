import Formatter

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

    private init(unchecked width: Double, height: Double) {
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

    public enum RatioError: Swift::Error, Sendable {
        case invalidValue(String)
    }

    public var quotient: Double {
        return width / height
    }

    public static let square = Ratio(unchecked: 1, height: 1)

    public static let tv = Ratio(unchecked: 4, height: 3)

    public static let widescreen = Ratio(unchecked: 16, height: 9)

    public static let ultrawide = Ratio(unchecked: 21, height: 9)

    public static let movie = Ratio(unchecked: 185, height: 100)

    public static let cinemascope = Ratio(unchecked: 239, height: 100)

}

extension Ratio: CustomStringConvertible {

    public var description: String {

        guard height == 1 else {
            return "\(width.formatted(Formatter.Number())) / \(height.formatted(Formatter.Number()))"
        }
        return width.formatted(Formatter.Number())
    }
}

extension Ratio: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {

        do {
            try self.init(value)
        } catch {
            fatalError("Ratio integer literal must be non-negative: \(error)")
        }
    }
}

extension Ratio: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {

        do {
            try self.init(value)
        } catch {
            fatalError("Ratio float literal must be non-negative: \(error)")
        }
    }
}

extension Ratio {

    public static func < (lhs: Ratio, rhs: Ratio) -> Bool {
        return lhs.quotient < rhs.quotient
    }

    public var inverse: Ratio {

        return Ratio(unchecked: height, height: width)
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

        do {
            return try Ratio(width / divisor, height / divisor)
        } catch {
            fatalError("Ratio simplification produced an invalid ratio: \(error)")
        }
    }
}
