public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum LightingColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case global(Global)
}

extension LightingColor {
    public static let property: String = "lighting-color"
}

extension LightingColor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}
