public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PointerEvents: Property {

    case auto

    case none

    case visiblePainted

    case visibleFill

    case visibleStroke

    case visible

    case painted

    case fill

    case stroke

    case boundingBox

    case all

    case global(Global)
}

extension PointerEvents {
    public static let property: String = "pointer-events"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .none: return "none"
        case .visiblePainted: return "visiblePainted"
        case .visibleFill: return "visibleFill"
        case .visibleStroke: return "visibleStroke"
        case .visible: return "visible"
        case .painted: return "painted"
        case .fill: return "fill"
        case .stroke: return "stroke"
        case .boundingBox: return "bounding-box"
        case .all: return "all"
        case .global(let global): return global.description
        }
    }
}
