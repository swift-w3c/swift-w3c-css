public import W3C_CSS_Shared
public import W3C_CSS_Values


extension MaskBorderWidth {
    public enum WidthValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {

        case length(Length)

        case percentage(Percentage)

        case number(Number)

        case auto
    }
}
