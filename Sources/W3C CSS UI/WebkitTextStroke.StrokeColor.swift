public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values


extension WebkitTextStroke {
    public enum StrokeColor: Sendable, Hashable, CustomStringConvertible, ColorConvertible {

        case color(W3C_CSS_Values::Color)

        case currentColor
    }
}
