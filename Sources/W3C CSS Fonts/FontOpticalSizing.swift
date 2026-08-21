public import W3C_CSS_Shared

public enum FontOpticalSizing: Property {

    case auto

    case none

    case global(Global)
}

extension FontOpticalSizing {
    public static let property: String = "font-optical-sizing"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .global(let value):
            return value.description
        }
    }
}
