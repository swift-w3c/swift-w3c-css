public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ColorInterpolation: Property {

    case auto

    case sRGB

    case linearRGB

    case global(Global)
}

extension ColorInterpolation {
    public static let property: String = "color-interpolation"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .sRGB: return "sRGB"
        case .linearRGB: return "linearRGB"
        case .global(let global): return global.description
        }
    }
}
