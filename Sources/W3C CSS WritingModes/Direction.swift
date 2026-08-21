public import W3C_CSS_Shared

public enum Direction: Property {

    case ltr

    case rtl

    case global(Global)
}

extension Direction {
    public static let property: String = "direction"

    public var description: String {
        switch self {
        case .ltr: return "ltr"
        case .rtl: return "rtl"
        case .global(let global): return global.description
        }
    }
}
