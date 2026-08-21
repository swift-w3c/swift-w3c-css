public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum InsetBlockStart: Property, LengthPercentageConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension InsetBlockStart {
    public static let property: String = "inset-block-start"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let value):
            return value.description

        case .global(let value):
            return value.description
        }
    }
}
