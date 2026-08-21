public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitTextStrokeColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case currentColor

    case global(Global)

    public init(_ color: W3C_CSS_Values.Color) {
        self = .color(color)
    }
}

extension WebkitTextStrokeColor {
    public static let property: String = "-webkit-text-stroke-color"

    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .currentColor:
            return "currentColor"

        case .global(let global):
            return global.description
        }
    }
}
