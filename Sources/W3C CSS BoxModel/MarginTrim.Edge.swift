public import W3C_CSS_Shared
import W3C_CSS_Values


extension MarginTrim {
    public enum Edge: String, Sendable, Hashable, CaseIterable {

        case blockStart = "block-start"

        case blockEnd = "block-end"

        case inlineStart = "inline-start"

        case inlineEnd = "inline-end"
    }
}
