public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockEndColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case global(Global)

    public init(_ color: W3C_CSS_Values.Color) {
        self = .color(color)
    }
}

extension BorderBlockEndColor {
    public static let property: String = "border-block-end-color"
}

extension BorderBlockEndColor: CustomStringConvertible {

    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}
