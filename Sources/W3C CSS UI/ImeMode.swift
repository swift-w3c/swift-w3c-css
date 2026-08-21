public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ImeMode: Property {

    case auto

    case normal

    case active

    case inactive

    case disabled

    case global(Global)
}

extension ImeMode {
    public static let property: String = "ime-mode"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .normal:
            return "normal"

        case .active:
            return "active"

        case .inactive:
            return "inactive"

        case .disabled:
            return "disabled"

        case .global(let global):
            return global.description
        }
    }
}
