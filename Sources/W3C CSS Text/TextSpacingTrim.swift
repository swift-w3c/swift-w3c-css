public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextSpacingTrim: Property {

    case normal

    case spaceAll

    case spaceFirst

    case trimStart

    case auto

    case global(Global)
}

extension TextSpacingTrim {
    public static let property: String = "text-spacing-trim"
    public var description: String {
        switch self {
        case .normal: return "normal"
        case .spaceAll: return "space-all"
        case .spaceFirst: return "space-first"
        case .trimStart: return "trim-start"
        case .auto: return "auto"
        case .global(let global): return global.description
        }
    }
}
