public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FloodColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case currentColor

    case global(Global)
}

extension FloodColor {
    public static let property: String = "flood-color"
}

extension FloodColor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .currentColor:
            return "currentcolor"

        case .global(let value):
            return value.description
        }
    }
}
