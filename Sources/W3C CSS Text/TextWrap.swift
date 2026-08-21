public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextWrap: Property {

    case wrap

    case nowrap

    case balance

    case pretty

    case stable

    case global(Global)
}

extension TextWrap {
    public static let property: String = "text-wrap"
}

extension TextWrap: CustomStringConvertible {

    public var description: String {
        switch self {
        case .wrap:
            return "wrap"

        case .nowrap:
            return "nowrap"

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
