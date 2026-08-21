public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ColorInterpolationFilters: Property {

    case linearRGB

    case sRGB

    case auto

    case global(Global)
}

extension ColorInterpolationFilters {
    public static let property: String = "color-interpolation-filters"

    public var description: String {
        switch self {
        case .linearRGB: return "linearRGB"
        case .sRGB: return "sRGB"
        case .auto: return "auto"
        case .global(let global): return global.description
        }
    }
}
