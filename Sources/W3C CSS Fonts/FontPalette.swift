public import W3C_CSS_Shared

public enum FontPalette: Property {

    case normal

    case light

    case dark

    case custom(String)

    case global(Global)
}

extension FontPalette {
    public static let property: String = "font-palette"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .light:
            return "light"

        case .dark:
            return "dark"

        case .custom(let identifier):
            return identifier

        case .global(let value):
            return value.description
        }
    }
}
