public import W3C_CSS_Shared
import W3C_CSS_Values

public enum EmptyCells: Property {

    case show

    case hide

    case global(Global)
}

extension EmptyCells {
    public static let property: String = "empty-cells"

    public var description: String {
        switch self {
        case .show:
            return "show"

        case .hide:
            return "hide"

        case .global(let value):
            return value.description
        }
    }
}
