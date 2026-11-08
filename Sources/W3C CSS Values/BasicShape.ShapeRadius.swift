import W3C_CSS_Shared

extension BasicShape {
    public enum ShapeRadius: Sendable, Hashable, LengthPercentageConvertible {
        case lengthPercentage(LengthPercentage)

        case closestSide

        case farthestSide
    }
}
