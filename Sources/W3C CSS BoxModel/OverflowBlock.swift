public import W3C_CSS_Shared

public enum OverflowBlock: Property {

    case visible

    case hidden

    case clip

    case scroll

    case auto

    case global(Global)
}

extension OverflowBlock {
    public static let property: String = "overflow-block"

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
