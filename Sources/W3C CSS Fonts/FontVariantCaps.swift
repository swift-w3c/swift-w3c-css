public import W3C_CSS_Shared

public enum FontVariantCaps: Property {

    case normal

    case smallCaps

    case allSmallCaps

    case petiteCaps

    case allPetiteCaps

    case unicase

    case titlingCaps

    case global(Global)
}

extension FontVariantCaps {
    public static let property: String = "font-variant-caps"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .smallCaps:
            return "small-caps"

        case .allSmallCaps:
            return "all-small-caps"

        case .petiteCaps:
            return "petite-caps"

        case .allPetiteCaps:
            return "all-petite-caps"

        case .unicase:
            return "unicase"

        case .titlingCaps:
            return "titling-caps"

        case .global(let value):
            return value.description
        }
    }
}
