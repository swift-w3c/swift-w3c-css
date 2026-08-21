public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Overlay: Property {

    case auto

    case none

    case global(Global)
}

extension Overlay {
    public static let property: String = "overlay"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .none: return "none"
        case .global(let global): return global.description
        }
    }
}
