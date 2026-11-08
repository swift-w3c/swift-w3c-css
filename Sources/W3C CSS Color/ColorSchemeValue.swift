public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ColorSchemeValue: Sendable, Hashable, CustomStringConvertible {

    case light

    case dark

    case custom(CSSString)
}
