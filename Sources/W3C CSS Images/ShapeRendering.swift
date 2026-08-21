public import W3C_CSS_Shared

public enum ShapeRendering: Property {

    case auto

    case crispEdges

    case geometricPrecision

    case optimizeSpeed

    case global(Global)
}

extension ShapeRendering {
    public static let property: String = "shape-rendering"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .crispEdges: return "crispEdges"
        case .geometricPrecision: return "geometricPrecision"
        case .optimizeSpeed: return "optimizeSpeed"
        case .global(let global): return global.description
        }
    }
}
