public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollSnapStop: Property {

    case normal

    case always

    case global(Global)

}

extension ScrollSnapStop {
    public static let property: String = "scroll-snap-stop"

    public var description: String {
        switch self {
        case .normal: return "normal"
        case .always: return "always"
        case .global(let global): return global.description
        }
    }
}
