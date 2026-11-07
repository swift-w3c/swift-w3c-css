public import W3C_CSS_Shared
public import W3C_CSS_Values


extension BorderImageWidth {
    public enum WidthValue: Sendable, Hashable, CustomStringConvertible, LengthPercentageConvertible {

        case lengthPercentage(LengthPercentage)

        case number(Number)

        case auto
    }
}
