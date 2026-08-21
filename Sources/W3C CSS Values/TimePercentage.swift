public enum TimePercentage: Sendable, Hashable, PercentageConvertible {

    case time(Time)

    case percentage(Percentage)
}

extension TimePercentage {

    public static func s(_ value: Double) -> TimePercentage {
        return .time(.s(value))
    }

    public static func ms(_ value: Double) -> TimePercentage {
        return .time(.ms(value))
    }

    public static let zero = TimePercentage.time(.zero)

    public static let half = TimePercentage.percentage(50)

    public static let full = TimePercentage.percentage(100)
}

extension TimePercentage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .time(let time):
            return time.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension TimePercentage {

    @_disfavoredOverload
    public static func * (lhs: TimePercentage, rhs: Double) -> TimePercentage {
        switch lhs {
        case .time(let time):
            return .time(time * rhs)

        case .percentage(let percentage):
            return .percentage(percentage * rhs)
        }
    }

    @_disfavoredOverload
    public static func / (lhs: TimePercentage, rhs: Double) -> TimePercentage {
        switch lhs {
        case .time(let time):
            return .time(time / rhs)

        case .percentage(let percentage):
            return .percentage(percentage / rhs)
        }
    }
}

extension TimePercentage: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .time(Time(integerLiteral: value))
    }
}

extension TimePercentage: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .time(Time(floatLiteral: value))
    }
}
