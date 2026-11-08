import W3C_CSS_Masking
public import W3C_CSS_Shared
public import W3C_CSS_Values

extension OffsetPath {
    public enum RaySize: Sendable, Hashable {

        case closestSide

        case closestCorner

        case farthestSide

        case farthestCorner

        case sides
    }
}
