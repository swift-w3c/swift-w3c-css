public import W3C_CSS_Shared

public enum FontSynthesisWeight: Property {

    case auto

    case none

    case global(Global)
}

extension FontSynthesisWeight {
    public static let property: String = "font-synthesis-weight"

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
