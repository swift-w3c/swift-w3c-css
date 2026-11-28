import Formatter
public import W3C_CSS_Shared
public import W3C_CSS_Variables

public struct Time: Sendable, Hashable {

    public let value: Double

    public let unit: Unit

    /// The custom property this time is read from, where it is not a literal.
    public let variable: W3C.CSS.Variable<Time>?

    public init(_ value: Double, unit: Unit) {
        self.value = value
        self.unit = unit
        self.variable = nil
    }

    private init(variable: W3C.CSS.Variable<Time>) {
        self.value = 0
        self.unit = .second
        self.variable = variable
    }

    /// The time a custom property holds: `var(--name)`.
    public static func variable(_ variable: W3C.CSS.Variable<Time>) -> Time {
        .init(variable: variable)
    }
}

extension Time {
}

extension Time.Unit {
    public static let s: Self = .second
    public static let ms: Self = .millisecond
}

extension Time {

    public static func s(_ value: Double) -> Time {
        return .init(value, unit: .second)
    }

    public static func ms(_ value: Double) -> Time {
        return .init(value, unit: .millisecond)
    }

    public static let zero = Time(0, unit: .second)

    public static let oneSecond = Time(1, unit: .second)

    public static let halfSecond = Time(0.5, unit: .second)

    public var inSeconds: Double {
        switch unit {
        case .second:
            return value

        case .millisecond:
            return value / 1000
        }
    }

    public var inMilliseconds: Double {
        switch unit {
        case .second:
            return value * 1000

        case .millisecond:
            return value
        }
    }

    public func converted(to targetUnit: Unit) -> Time {
        if unit == targetUnit {
            return self
        }

        switch targetUnit {
        case .second:
            return .init(inSeconds, unit: .second)

        case .millisecond:
            return .init(inMilliseconds, unit: .ms)
        }
    }
}

extension Time: CustomStringConvertible {

    public var description: String {
        if let variable { return variable.description }
        return "\(value.formatted(Formatter.Number()))\(unit.rawValue)"
    }
}

extension Time {

    public static func + (lhs: Time, rhs: Time) -> Time {
        let seconds = lhs.inSeconds + rhs.inSeconds
        return .init(seconds, unit: .second).converted(to: lhs.unit)
    }

    public static func - (lhs: Time, rhs: Time) -> Time {
        let seconds = lhs.inSeconds - rhs.inSeconds
        return .init(seconds, unit: .second).converted(to: lhs.unit)
    }

    @_disfavoredOverload
    public static func * (lhs: Time, rhs: Double) -> Time {
        return .init(lhs.value * rhs, unit: lhs.unit)
    }

    @_disfavoredOverload
    public static func / (lhs: Time, rhs: Double) -> Time {
        return .init(lhs.value / rhs, unit: lhs.unit)
    }

    @_disfavoredOverload
    public static prefix func - (time: Time) -> Time {
        return .init(-time.value, unit: time.unit)
    }
}

extension Time: Comparable {

    public static func < (lhs: Time, rhs: Time) -> Bool {
        return lhs.inSeconds < rhs.inSeconds
    }

    public static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.variable == rhs.variable && lhs.inSeconds == rhs.inSeconds
    }
}

extension Time: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(Double(value), unit: .second)
    }
}

extension Time: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self.init(value, unit: .second)
    }
}
