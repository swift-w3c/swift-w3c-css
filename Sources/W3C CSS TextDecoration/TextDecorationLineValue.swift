public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextDecorationLineValue: Sendable, Hashable, CustomStringConvertible {

    case none

    case underline

    case overline

    case lineThrough

    case blink

    case spellingError

    case grammarError
}
