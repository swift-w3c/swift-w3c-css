public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Hyphens: Property {

    case none

    case manual

    case auto

    case global(Global)
}

extension Hyphens {
    public static let property: String = "hyphens"
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .manual:
            return "manual"

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}
