public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct CircleShape: Sendable, Hashable {

    public var radius: LengthPercentage

    public var center: Point?

    public init(radius: LengthPercentage, center: Point? = nil) {
        self.radius = radius
        self.center = center
    }
}
