public import W3C_CSS_Shared
import W3C_CSS_Values


extension SpeakAs {
    public struct Options: Sendable, Hashable, CustomStringConvertible {

        public let mode: SpeakingMode

        public let digits: Bool

        public let punctuation: PunctuationMode

        public init(
            mode: SpeakingMode = .normal,
            digits: Bool = false,
            punctuation: PunctuationMode = .auto
        ) {
            self.mode = mode
            self.digits = digits
            self.punctuation = punctuation
        }
    }
}
