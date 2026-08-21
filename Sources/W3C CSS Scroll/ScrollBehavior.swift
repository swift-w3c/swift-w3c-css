public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollBehavior: Property {

    case auto

    case smooth

    case global(Global)

}

extension ScrollBehavior {
    public static let property: String = "scroll-behavior"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .smooth: return "smooth"
        case .global(let global): return global.description
        }
    }
}
