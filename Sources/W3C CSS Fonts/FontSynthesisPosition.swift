public import W3C_CSS_Shared

public enum FontSynthesisPosition: Property {

    case auto

    case none

    case global(Global)
}

extension FontSynthesisPosition {
    public static let property: String = "font-synthesis-position"

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
