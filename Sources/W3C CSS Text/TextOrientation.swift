public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextOrientation: Property {

    case mixed

    case upright

    case sideways

    case sidewaysRight

    case useGlyphOrientation

    case global(Global)
}

extension TextOrientation {
    public static let property: String = "text-orientation"
    public var description: String {
        switch self {
        case .mixed: return "mixed"
        case .upright: return "upright"
        case .sideways: return "sideways"
        case .sidewaysRight: return "sideways-right"
        case .useGlyphOrientation: return "use-glyph-orientation"
        case .global(let global): return global.description
        }
    }
}
