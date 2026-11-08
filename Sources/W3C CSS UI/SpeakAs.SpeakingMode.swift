public import W3C_CSS_Shared
import W3C_CSS_Values

extension SpeakAs {
    public enum SpeakingMode: Sendable, Hashable, CustomStringConvertible {

        case normal

        case spellOut
    }
}
