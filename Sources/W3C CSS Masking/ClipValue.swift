public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ClipValue: Sendable, Hashable, LengthConvertible {

    case length(Length)

    case auto
}
