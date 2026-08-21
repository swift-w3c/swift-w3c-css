public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BackgroundColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case global(Global)

    public init(_ color: W3C_CSS_Values.Color) {
        self = .color(color)
    }
}

extension BackgroundColor {
    public static let property: String = "background-color"
}

extension BackgroundColor: CustomStringConvertible {

    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}
