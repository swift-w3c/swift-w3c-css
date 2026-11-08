public import W3C_CSS_Shared

extension FontSynthesis {
    public enum SynthesisOption: String, Sendable, CustomStringConvertible {

        case weight

        case style

        case smallCaps = "small-caps"

        case position
    }
}
