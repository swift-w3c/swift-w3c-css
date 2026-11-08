import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

extension BoxShadow {
    public struct Shadow: Sendable, Hashable, CustomStringConvertible {

        public let offsetX: Length

        public let offsetY: Length

        public let blurRadius: Length?

        public let spreadRadius: Length?

        public let color: W3C_CSS_Values::Color?

        public let isInset: Bool

        public init(
            offsetX: Length,
            offsetY: Length,
            blurRadius: Length? = nil,
            spreadRadius: Length? = nil,
            color: W3C_CSS_Values::Color? = nil,
            isInset: Bool = false
        ) {
            self.offsetX = offsetX
            self.offsetY = offsetY
            self.blurRadius = blurRadius
            self.spreadRadius = spreadRadius
            self.color = color
            self.isInset = isInset
        }
    }
}
