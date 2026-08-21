public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ContentVisibility: Property {

    case visible

    case hidden

    case auto

    case global(Global)
}

extension ContentVisibility {
    public static let property: String = "content-visibility"

    public var description: String {
        switch self {
        case .visible:
            return "visible"

        case .hidden:
            return "hidden"

        case .auto:
            return "auto"

        case .global(let value):
            return value.description
        }
    }
}
