public import W3C_CSS_Shared
import W3C_CSS_Values

public enum CaptionSide: Property {

    case top

    case bottom

    case global(Global)
}

extension CaptionSide {
    public static let property: String = "caption-side"

    public var description: String {
        switch self {
        case .top: return "top"
        case .bottom: return "bottom"
        case .global(let global): return global.description
        }
    }
}
