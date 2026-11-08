public import W3C_CSS_Shared
public import W3C_CSS_Values


extension Padding {
    public struct NamedSides: Sendable, Hashable {

        public var top: LengthPercentage?

        public var right: LengthPercentage?

        public var bottom: LengthPercentage?

        public var left: LengthPercentage?

        public init(
            top: LengthPercentage? = nil,
            right: LengthPercentage? = nil,
            bottom: LengthPercentage? = nil,
            left: LengthPercentage? = nil
        ) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }

        public init(vertical: LengthPercentage? = nil, horizontal: LengthPercentage? = nil) {
            self.top = vertical
            self.right = horizontal
            self.bottom = vertical
            self.left = horizontal
        }
    }
}
