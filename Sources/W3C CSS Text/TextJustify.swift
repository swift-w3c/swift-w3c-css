public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextJustify: Property {

    case none

    case auto

    case interWord

    case interCharacter

    case global(Global)
}

extension TextJustify {
    public static let property: String = "text-justify"
    public var description: String {
        switch self {
        case .none: return "none"
        case .auto: return "auto"
        case .interWord: return "inter-word"
        case .interCharacter: return "inter-character"
        case .global(let global): return global.description
        }
    }
}
