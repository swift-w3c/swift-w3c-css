public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values


extension WebkitTextStroke {
    public enum StrokeWidth: Sendable, Hashable, CustomStringConvertible {

        case thin

        case medium

        case thick

        case length(Length)
    }
}
