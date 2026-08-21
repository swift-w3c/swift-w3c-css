public enum NumberPercentage: Sendable, Hashable, NumberConvertible, PercentageConvertible {

    case number(Number)

    case percentage(Percentage)
}

extension NumberPercentage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}

extension NumberPercentage: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: IntegerLiteralType) {
        self = .number(.init(value))
    }
}

extension NumberPercentage: ExpressibleByFloatLiteral {

    public init(floatLiteral value: FloatLiteralType) {
        self = .number(.init(value))
    }
}
