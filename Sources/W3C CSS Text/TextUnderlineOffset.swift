public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextUnderlineOffset: Property, LengthPercentageConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension TextUnderlineOffset {
    public static let property: String = "text-underline-offset"
}

extension TextUnderlineOffset: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let value):
            return value.description

        case .global(let global):
            return global.description
        }
    }
}
