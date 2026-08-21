public import W3C_CSS_Shared

public enum OverflowX: Property {

    case visible

    case hidden

    case clip

    case scroll

    case auto

    case global(Global)
}

extension OverflowX {
    public static let property: String = "overflow-x"

    public var description: String {
        switch self {
        case .visible:
            return "visible"

        case .hidden:
            return "hidden"

        case .clip:
            return "clip"

        case .scroll:
            return "scroll"

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}
