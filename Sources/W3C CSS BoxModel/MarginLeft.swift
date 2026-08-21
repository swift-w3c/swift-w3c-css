public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MarginLeft: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral
{

    case lengthPercentage(LengthPercentage)

    case auto

    case global(Global)

    public init(floatLiteral value: Double) {
        self = .px(value)
    }

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }
}

extension MarginLeft {
    public static let property: String = "margin-left"

    public var description: String {
        switch self {
        case .lengthPercentage(let value):
            return value.description

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}
