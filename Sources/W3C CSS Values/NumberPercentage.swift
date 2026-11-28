public import W3C_CSS_Shared

public enum NumberPercentage: Sendable, Hashable, NumberConvertible, PercentageConvertible {

    case number(Number)

    case percentage(Percentage)

    case calculation(W3C.CSS.Calculation)
}

extension NumberPercentage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .percentage(let percentage):
            return percentage.description

        case .calculation(let calculation):
            return calculation.description
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
