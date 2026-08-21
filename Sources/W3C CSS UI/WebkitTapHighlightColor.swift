public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitTapHighlightColor: Property, ColorConvertible {

    case color(W3C_CSS_Values.Color)

    case transparent

    case global(Global)
}

extension WebkitTapHighlightColor {
    public static let property: String = "-webkit-tap-highlight-color"

    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .transparent:
            return "transparent"

        case .global(let global):
            return global.description
        }
    }
}

extension WebkitTapHighlightColor {

    public static let `default` = WebkitTapHighlightColor.color(.named(.black))

    public static func alpha(
        _ color: W3C_CSS_Values.Color,
        opacity: Double
    ) -> WebkitTapHighlightColor {

        let clampedOpacity = max(0, min(1, opacity))

        switch color {
        case .rgba(let r, let g, let b, _):
            return .color(.rgba(r, g, b, clampedOpacity))

        default:

            return .color(.rgba(0, 0, 0, clampedOpacity))
        }
    }
}
