public import W3C_CSS_Shared
public import W3C_CSS_Values

extension MaskBorderOutset {
    public enum OutsetValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {

        case length(Length)

        case number(Number)
    }
}
