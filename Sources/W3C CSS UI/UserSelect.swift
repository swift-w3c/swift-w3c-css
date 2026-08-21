public import W3C_CSS_Shared
import W3C_CSS_Values

public enum UserSelect: Property {

    case none

    case auto

    case text

    case all

    case global(Global)
}

extension UserSelect {
    public static let property: String = "user-select"

    public var description: String {
        switch self {
        case .none: return "none"
        case .auto: return "auto"
        case .text: return "text"
        case .all: return "all"
        case .global(let global): return global.description
        }
    }
}
