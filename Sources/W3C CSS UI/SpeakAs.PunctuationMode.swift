public import W3C_CSS_Shared
import W3C_CSS_Values


extension SpeakAs {
    public enum PunctuationMode: String, Sendable, Hashable, CustomStringConvertible {

        case auto

        case literalPunctuation = "literal-punctuation"

        case noPunctuation = "no-punctuation"
    }
}
