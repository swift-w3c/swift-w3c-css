public import W3C_CSS_Shared

public enum ListStylePosition: Property {

    case inside

    case outside

    case global(Global)
}

extension ListStylePosition {
    public static let property: String = "list-style-position"

    public var description: String {
        switch self {
        case .inside:
            return "inside"

        case .outside:
            return "outside"

        case .global(let global):
            return global.description
        }
    }
}
