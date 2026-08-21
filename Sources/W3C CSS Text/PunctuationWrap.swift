public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PunctuationWrap: Property {

    case none

    case hangingInitial

    case hangingFinal

    case hangingAll

    case allowEnd

    case global(Global)
}

extension PunctuationWrap {
    public static let property: String = "punctuation-wrap"
    public var description: String {
        switch self {
        case .none: return "none"
        case .hangingInitial: return "hanging-initial"
        case .hangingFinal: return "hanging-final"
        case .hangingAll: return "hanging-all"
        case .allowEnd: return "allow-end"
        case .global(let global): return global.description
        }
    }
}
