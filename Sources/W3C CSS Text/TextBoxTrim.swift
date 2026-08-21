public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextBoxTrim: Property {

    case none

    case trimBoth

    case trimStart

    case trimEnd

    case global(Global)
}

extension TextBoxTrim {
    public static let property: String = "text-box-trim"
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .trimBoth:
            return "trim-both"

        case .trimStart:
            return "trim-start"

        case .trimEnd:
            return "trim-end"

        case .global(let global):
            return global.description
        }
    }
}
