public import W3C_CSS_Shared

public enum FillRule: Property {

    case nonzero

    case evenodd

    case global(Global)
}

extension FillRule {
    public static let property: String = "fill-rule"

    public var description: String {
        switch self {
        case .nonzero:
            return "nonzero"

        case .evenodd:
            return "evenodd"

        case .global(let value):
            return value.description
        }
    }
}
