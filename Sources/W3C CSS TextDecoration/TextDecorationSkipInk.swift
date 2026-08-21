public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextDecorationSkipInk: Property {

    case auto

    case none

    case all

    case global(Global)
}

extension TextDecorationSkipInk {
    public static let property: String = "text-decoration-skip-ink"
}

extension TextDecorationSkipInk: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .all:
            return "all"

        case .global(let global):
            return global.description
        }
    }
}
