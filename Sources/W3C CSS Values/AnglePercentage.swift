public enum AnglePercentage: Sendable, Hashable, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, PercentageConvertible, AngleConvertible
{

    case angle(Angle)

    case percentage(Percentage)

    public init(integerLiteral value: Int) {
        self = .angle(.deg(Double(value)))
    }

    public init(floatLiteral value: Double) {
        self = .angle(.deg(value))
    }
}

extension AnglePercentage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .angle(let angle):
            return angle.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}
