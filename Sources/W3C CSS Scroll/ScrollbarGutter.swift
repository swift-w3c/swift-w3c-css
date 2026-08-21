public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollbarGutter: Property {

    case auto

    case stable

    case stableBothEdges

    case global(Global)

}

extension ScrollbarGutter {
    public static let property: String = "scrollbar-gutter"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .stable: return "stable"
        case .stableBothEdges: return "stable both-edges"
        case .global(let global): return global.description
        }
    }
}
