public import W3C_CSS_Shared

public enum FontKerning: Property {

    case auto

    case normal

    case none

    case global(Global)
}

extension FontKerning {
    public static let property: String = "font-kerning"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .normal:
            return "normal"

        case .none:
            return "none"

        case .global(let value):
            return value.description
        }
    }
}
