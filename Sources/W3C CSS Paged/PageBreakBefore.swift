public import W3C_CSS_Shared

public enum PageBreakBefore: Property {

    case auto

    case always

    case avoid

    case left

    case right

    case global(Global)
}

extension PageBreakBefore {
    public static let property: String = "page-break-before"
}

extension PageBreakBefore: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .always:
            return "always"

        case .avoid:
            return "avoid"

        case .left:
            return "left"

        case .right:
            return "right"

        case .global(let global):
            return global.description
        }
    }
}
