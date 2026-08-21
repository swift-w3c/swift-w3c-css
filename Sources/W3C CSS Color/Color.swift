public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Color: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case global(Global)
}

extension Color: CustomStringConvertible {
    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}

extension Color {
    public static let property: String = "color"

    public static let currentColor: Color = .color(.currentColor)
}
