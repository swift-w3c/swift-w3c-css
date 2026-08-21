public import W3C_CSS_Shared

public enum FlexWrap: Property {

    case nowrap

    case wrap

    case wrapReverse

    case global(Global)
}

extension FlexWrap {
    public static let property: String = "flex-wrap"

    public var description: String {
        switch self {
        case .nowrap:
            return "nowrap"

        case .wrap:
            return "wrap"

        case .wrapReverse:
            return "wrap-reverse"

        case .global(let value):
            return value.description
        }
    }
}
