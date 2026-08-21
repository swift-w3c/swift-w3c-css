public import W3C_CSS_Shared

public enum VectorEffect: Property {

    case none

    case nonScalingStroke

    case global(Global)
}

extension VectorEffect {
    public static let property: String = "vector-effect"

    public var description: String {
        switch self {
        case .none: return "none"
        case .nonScalingStroke: return "non-scaling-stroke"
        case .global(let global): return global.description
        }
    }
}
