public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextWrapStyle: Property {

    case auto

    case balance

    case pretty

    case stable

    case global(Global)
}

extension TextWrapStyle {
    public static let property: String = "text-wrap-style"
}

extension TextWrapStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .balance:
            return "balance"

        case .pretty:
            return "pretty"

        case .stable:
            return "stable"

        case .global(let global):
            return global.description
        }
    }
}
