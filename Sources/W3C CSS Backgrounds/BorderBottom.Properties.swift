public import W3C_CSS_Shared
public import W3C_CSS_Values


extension BorderBottom {
    public struct Properties: Sendable, Hashable, CustomStringConvertible {

        public let width: BorderWidth?

        public let style: LineStyle?

        public let color: Color?

        public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
            self.width = width
            self.style = style
            self.color = color
        }
    }
}
