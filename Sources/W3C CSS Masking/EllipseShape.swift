public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct EllipseShape: Sendable, Hashable {

    public var radiusX: LengthPercentage

    public var radiusY: LengthPercentage

    public var center: Point?

    public init(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage,
        center: Point? = nil
    ) {
        self.radiusX = radiusX
        self.radiusY = radiusY
        self.center = center
    }
}
