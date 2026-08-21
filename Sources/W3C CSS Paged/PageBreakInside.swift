public import W3C_CSS_Shared

public enum PageBreakInside: Property {

    case auto

    case avoid

    case global(Global)
}

extension PageBreakInside {
    public static let property: String = "page-break-inside"
}

extension PageBreakInside: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .avoid:
            return "avoid"

        case .global(let global):
            return global.description
        }
    }
}
