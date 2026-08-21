public import W3C_CSS_Shared

public enum OverflowAnchor: Property {

    case auto

    case none

    case global(Global)
}

extension OverflowAnchor {
    public static let property: String = "overflow-anchor"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}
