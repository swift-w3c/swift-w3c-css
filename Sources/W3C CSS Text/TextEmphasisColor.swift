public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextEmphasisColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case global(Global)
}

extension TextEmphasisColor {
    public static let property: String = "text-emphasis-color"
    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}

extension TextEmphasisColor {

    public static var currentColor: TextEmphasisColor {
        .color(.currentColor)
    }
}
