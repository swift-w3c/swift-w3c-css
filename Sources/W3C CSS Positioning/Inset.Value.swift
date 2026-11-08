public import W3C_CSS_Shared
public import W3C_CSS_Values

extension Inset {
    public enum Value: Hashable, Sendable, LengthPercentageConvertible {

        case auto

        case lengthPercentage(LengthPercentage)
    }
}
