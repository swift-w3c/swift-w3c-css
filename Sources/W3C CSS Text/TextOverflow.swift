public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextOverflow: Property {

    case clip

    case ellipsis

    case string(CSSString)

    case global(Global)
}

extension TextOverflow {
    public static let property: String = "text-overflow"
}

extension TextOverflow: CustomStringConvertible {
    public var description: String {
        switch self {
        case .clip:
            return "clip"

        case .ellipsis:
            return "ellipsis"

        case .string(let value):
            return value.description

        case .global(let global):
            return global.description
        }
    }
}
