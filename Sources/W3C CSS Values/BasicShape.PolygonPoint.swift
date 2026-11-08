import W3C_CSS_Shared

extension BasicShape {
    public struct PolygonPoint: Sendable, Hashable {

        public let x: LengthPercentage

        public let y: LengthPercentage

        public init(_ x: LengthPercentage, _ y: LengthPercentage) {
            self.x = x
            self.y = y
        }
    }
}
