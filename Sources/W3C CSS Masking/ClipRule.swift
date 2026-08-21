public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ClipRule: Property {

    case nonzero

    case evenodd

    case global(Global)
}

extension ClipRule {
    public static let property: String = "clip-rule"

    public var description: String {
        switch self {
        case .nonzero: return "nonzero"
        case .evenodd: return "evenodd"
        case .global(let global): return global.description
        }
    }
}
