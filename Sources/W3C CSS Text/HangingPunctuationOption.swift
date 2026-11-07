public import W3C_CSS_Shared
import W3C_CSS_Values

public enum HangingPunctuationOption: String, Sendable, Hashable, CaseIterable {

    case first

    case last

    case allowEnd = "allow-end"
}
