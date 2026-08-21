public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AccentColor: Property, ColorConvertible {

    case auto

    case color(W3C_CSS_Values.Color)

    case global(Global)
}

extension AccentColor {
    public static let property: String = "accent-color"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}
