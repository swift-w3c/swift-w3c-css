public import W3C_CSS_Shared

public enum ImageRendering: Property {

    case auto

    case smooth

    case crispEdges

    case pixelated

    case highQuality

    case global(Global)
}

extension ImageRendering {
    public static let property: String = "image-rendering"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .smooth:
            return "smooth"

        case .crispEdges:
            return "crisp-edges"

        case .pixelated:
            return "pixelated"

        case .highQuality:
            return "high-quality"

        case .global(let global):
            return global.description
        }
    }
}
