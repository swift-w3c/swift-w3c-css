public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextWrapMode: Property {

    case wrap

    case nowrap

    case global(Global)
}

extension TextWrapMode {
    public static let property: String = "text-wrap-mode"
}

extension TextWrapMode: CustomStringConvertible {

    public var description: String {
        switch self {
        case .wrap:
            return "wrap"

        case .nowrap:
            return "nowrap"

        case .global(let global):
            return global.description
        }
    }
}
