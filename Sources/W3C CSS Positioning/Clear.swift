public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Clear: Property {

    case none

    case left

    case right

    case both

    case inlineStart

    case inlineEnd

    case global(Global)
}

extension Clear {
    public static let property: String = "clear"

    public var description: String {
        switch self {
        case .none: return "none"
        case .left: return "left"
        case .right: return "right"
        case .both: return "both"
        case .inlineStart: return "inline-start"
        case .inlineEnd: return "inline-end"
        case .global(let global): return global.description
        }
    }
}
