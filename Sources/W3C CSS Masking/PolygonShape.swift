public import W3C_CSS_Shared
public import W3C_CSS_Values

public struct PolygonShape: Sendable, Hashable {

    public var points: [Point]

    public init(points: [Point]) {
        self.points = points
    }
}
