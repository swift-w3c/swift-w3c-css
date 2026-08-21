public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WebkitTouchCallout: Property {

    case `default`

    case none

    case global(Global)
}

extension WebkitTouchCallout {
    public static let property: String = "-webkit-touch-callout"

    public var description: String {
        switch self {
        case .default:
            return "default"

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}
