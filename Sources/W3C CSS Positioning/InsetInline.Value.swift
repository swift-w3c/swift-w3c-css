public import W3C_CSS_Shared
public import W3C_CSS_Values


extension InsetInline {
    public enum Value: Hashable, Sendable {

        case auto

        case lengthPercentage(LengthPercentage)
    }
}
