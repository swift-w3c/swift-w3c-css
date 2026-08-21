public enum AlphaValue: Sendable, Hashable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
    PercentageConvertible
{

    case number(Number)

    case percentage(Percentage)

    public init(integerLiteral value: Int) {
        self = .number(.init(value))
    }

    public init(floatLiteral value: Double) {
        self = .number(.init(value))
    }
}

extension AlphaValue: CustomStringConvertible {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}
