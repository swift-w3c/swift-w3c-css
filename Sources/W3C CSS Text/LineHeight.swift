public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum LineHeight: Property, LengthPercentageConvertible, ExpressibleByFloatLiteral,
    ExpressibleByIntegerLiteral
{

    case normal

    case lengthPercentage(LengthPercentage)

    case multiple(Double)

    case global(Global)

    public init(floatLiteral value: Double) {
        self = .multiple(value)
    }

    public init(integerLiteral value: Int) {
        self = .multiple(Double(value))
    }
}

extension LineHeight {
    public static let property: String = "line-height"
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .multiple(let factor):

            let nonNegative = max(0, factor)
            return nonNegative.formatted(.number)

        case .global(let value):
            return value.description
        }
    }
}
