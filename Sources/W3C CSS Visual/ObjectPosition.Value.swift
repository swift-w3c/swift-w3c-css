import W3C_CSS_Positioning
public import W3C_CSS_Shared
public import W3C_CSS_Values

extension ObjectPosition {
    public enum Value: Sendable, Hashable, LengthPercentageConvertible {

        case keyword(W3C_CSS_Values::Position.Keyword)

        case lengthPercentage(LengthPercentage)
    }
}
