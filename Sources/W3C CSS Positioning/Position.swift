public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Position: Property {

    case `static`

    case relative

    case absolute

    case fixed

    case sticky

    case global(Global)
}

extension Position {
    public static let property: String = "position"

    public var description: String {
        switch self {
        case .static: return "static"
        case .relative: return "relative"
        case .absolute: return "absolute"
        case .fixed: return "fixed"
        case .sticky: return "sticky"
        case .global(let global): return global.description
        }
    }
}
