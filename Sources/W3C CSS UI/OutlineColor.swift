public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OutlineColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case auto

    case global(Global)
}

extension OutlineColor: CustomStringConvertible {
    public static let property: String = "outline-color"

    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}
