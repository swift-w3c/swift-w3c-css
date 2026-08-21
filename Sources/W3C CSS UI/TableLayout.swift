public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TableLayout: Property {

    case auto

    case fixed

    case global(Global)
}

extension TableLayout {
    public static let property: String = "table-layout"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .fixed: return "fixed"
        case .global(let global): return global.description
        }
    }
}
