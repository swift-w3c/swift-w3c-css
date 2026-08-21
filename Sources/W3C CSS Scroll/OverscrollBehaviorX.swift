public import W3C_CSS_Shared
import W3C_CSS_Values

public enum OverscrollBehaviorX: Property {

    case auto

    case contain

    case none

    case global(Global)

}

extension OverscrollBehaviorX {
    public static let property: String = "overscroll-behavior-x"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .contain: return "contain"
        case .none: return "none"
        case .global(let global): return global.description
        }
    }
}
