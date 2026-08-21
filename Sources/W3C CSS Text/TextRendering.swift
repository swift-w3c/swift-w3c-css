public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextRendering: Property {

    case auto

    case optimizeSpeed

    case optimizeLegibility

    case geometricPrecision

    case global(Global)
}

extension TextRendering {
    public static let property: String = "text-rendering"
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .optimizeSpeed: return "optimizeSpeed"
        case .optimizeLegibility: return "optimizeLegibility"
        case .geometricPrecision: return "geometricPrecision"
        case .global(let global): return global.description
        }
    }
}
