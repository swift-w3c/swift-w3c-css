public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BorderCollapse: Property {

    case collapse

    case separate

    case global(Global)
}

extension BorderCollapse {
    public static let property: String = "border-collapse"
}

extension BorderCollapse: CustomStringConvertible {

    public var description: String {
        switch self {
        case .collapse:
            return "collapse"

        case .separate:
            return "separate"

        case .global(let global):
            return global.description
        }
    }
}

extension BorderCollapse {

    public static let `default` = BorderCollapse.separate
}
