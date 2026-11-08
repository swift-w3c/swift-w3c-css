public import W3C_CSS_Shared
import W3C_CSS_Values

public enum HyphenLimit: Sendable, Hashable, CustomStringConvertible {
    case auto
    case value(Int)
}
