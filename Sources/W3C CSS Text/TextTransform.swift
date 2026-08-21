public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextTransform: Property {

    case none

    case capitalize

    case uppercase

    case lowercase

    case fullWidth

    case fullSizeKana

    case mathAuto

    case global(Global)
}

extension TextTransform {
    public static let property: String = "text-transform"
    public var description: String {
        switch self {
        case .none: return "none"
        case .capitalize: return "capitalize"
        case .uppercase: return "uppercase"
        case .lowercase: return "lowercase"
        case .fullWidth: return "full-width"
        case .fullSizeKana: return "full-size-kana"
        case .mathAuto: return "math-auto"
        case .global(let global): return global.description
        }
    }
}
