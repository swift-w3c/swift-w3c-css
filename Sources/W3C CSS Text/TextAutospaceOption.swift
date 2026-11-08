public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextAutospaceOption: String, Sendable, Hashable, CaseIterable {

    case ideographAlpha = "ideograph-alpha"

    case ideographNumeric = "ideograph-numeric"

    case ideographParenthesis = "ideograph-parenthesis"

    case punctuation = "punctuation"

    case all = "all"
}
