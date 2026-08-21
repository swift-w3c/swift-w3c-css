public import W3C_CSS_Shared

public enum StrokeLinejoin: Property {

    case miter

    case bevel

    case round

    case global(Global)
}

extension StrokeLinejoin {
    public static let property: String = "stroke-linejoin"

    public var description: String {
        switch self {
        case .miter: return "miter"
        case .bevel: return "bevel"
        case .round: return "round"
        case .global(let global): return global.description
        }
    }
}
