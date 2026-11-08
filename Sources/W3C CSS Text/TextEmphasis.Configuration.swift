public import W3C_CSS_Shared
import W3C_CSS_Values


extension TextEmphasis {
    public struct Configuration: Sendable, Hashable, CustomStringConvertible {

        public let style: TextEmphasisStyle

        public let color: TextEmphasisColor?

        public init(style: TextEmphasisStyle, color: TextEmphasisColor? = nil) {
            self.style = style
            self.color = color
        }
    }
}
