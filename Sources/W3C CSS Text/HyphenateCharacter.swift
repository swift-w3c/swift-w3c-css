public import W3C_CSS_Shared
import W3C_CSS_Values

public enum HyphenateCharacter: Property {

    case auto

    case string(CSSString)

    case global(Global)
}

extension HyphenateCharacter {
    public static let property: String = "hyphenate-character"
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .string(let string):
            return string.description

        case .global(let global):
            return global.description
        }
    }
}
