public import W3C_CSS_Shared

public enum PageBreakAfter: Property {

    case auto

    case always

    case avoid

    case left

    case right

    case global(Global)
}

extension PageBreakAfter {
    public static let property: String = "page-break-after"
}

extension PageBreakAfter: CustomStringConvertible {

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
