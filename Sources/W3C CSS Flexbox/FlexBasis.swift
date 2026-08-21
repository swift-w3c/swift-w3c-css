public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FlexBasis: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral
{

    case auto

    case content

    case minContent

    case maxContent

    case fitContent

    case lengthPercentage(LengthPercentage)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }

    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}

extension FlexBasis {
    public static let property: String = "flex-basis"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .content:
            return "content"

        case .minContent:
            return "min-content"

        case .maxContent:
            return "max-content"

        case .fitContent:
            return "fit-content"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let value):
            return value.description
        }
    }
}
