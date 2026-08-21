public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MozUserFocus: Property {

    case none

    case normal

    case ignore

    case global(Global)
}

extension MozUserFocus {
    public static let property: String = "-moz-user-focus"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .normal:
            return "normal"

        case .ignore:
            return "ignore"

        case .global(let global):
            return global.description
        }
    }
}
