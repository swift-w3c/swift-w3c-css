import Format_Primitives

@dynamicMemberLookup
public struct Percentage: Sendable, Hashable {

    public let value: Double

    public init(_ value: Double) {
        self.value = value
    }

    public init(_ value: Int) {
        self.value = Double(value)
    }
}

extension Percentage {

    public static let zero = Percentage(0)

    public static let half = Percentage(50)

    public static let full = Percentage(100)

    subscript<T>(dynamicMember keyPath: KeyPath<Double, T>) -> T {
        value[keyPath: keyPath]
    }
}

extension Percentage: CustomStringConvertible {

    public var description: String {
        return "\(value.formatted(.number))%"
    }
}

extension Percentage: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

extension Percentage: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

extension Percentage {

    @_disfavoredOverload
    public static func < (lhs: Percentage, rhs: Percentage) -> Bool {
        return lhs.value < rhs.value
    }

    @_disfavoredOverload
    public static func + (lhs: Percentage, rhs: Percentage) -> Percentage {
        return Percentage(lhs.value + rhs.value)
    }

    @_disfavoredOverload
    public static func - (lhs: Percentage, rhs: Percentage) -> Percentage {
        return Percentage(lhs.value - rhs.value)
    }

    @_disfavoredOverload
    public static func * (lhs: Percentage, rhs: Double) -> Percentage {
        return Percentage(lhs.value * rhs)
    }

    @_disfavoredOverload
    public static func / (lhs: Percentage, rhs: Double) -> Percentage {
        return Percentage(lhs.value / rhs)
    }

    public func fraction(_ fraction: Double) -> Percentage {
        return self * fraction
    }
}

extension Int {
    public var percentage: Percentage { .init(integerLiteral: self) }
    public var percent: Percentage { self.percentage }
}

extension Double {
    public var percentage: Percentage { .init(floatLiteral: self) }
    public var percent: Percentage { self.percentage }
}

extension Percentage: Comparable {

}
