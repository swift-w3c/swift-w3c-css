public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextDecorationColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case global(Global)
}

extension TextDecorationColor {
    public static let property: String = "text-decoration-color"
}

extension TextDecorationColor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}
