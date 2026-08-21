public import W3C_CSS_Shared

public enum FontVariantPosition: Property {

    case normal

    case sub

    case `super`

    case global(Global)
}

extension FontVariantPosition {
    public static let property: String = "font-variant-position"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .sub:
            return "sub"

        case .super:
            return "super"

        case .global(let global):
            return global.description
        }
    }
}
