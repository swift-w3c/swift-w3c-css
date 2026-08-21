public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WhiteSpace: Property {

    case normal

    case pre

    case preWrap

    case preLine

    case nowrap

    case breakSpaces

    case global(Global)
}

extension WhiteSpace {
    public static let property: String = "white-space"
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .pre:
            return "pre"

        case .preWrap:
            return "pre-wrap"

        case .preLine:
            return "pre-line"

        case .nowrap:
            return "nowrap"

        case .breakSpaces:
            return "break-spaces"

        case .global(let global):
            return global.description
        }
    }
}
