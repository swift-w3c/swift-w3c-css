import Formatter
public import Geometry

extension Geometry.Polygon where Scalar == Double, Space == W3C.CSS.Space {
    public struct Context {
        let polygon: Geometry<Double, W3C.CSS.Space>.Polygon

        init(_ polygon: Geometry<Double, W3C.CSS.Space>.Polygon) {
            self.polygon = polygon
        }
    }
}

extension Geometry.Polygon.Context {
    public var clipPath: String {
        let pointsStr = polygon.vertices.map { vertex in
            "\(vertex.x.formatted(Formatter.Number()))px \(vertex.y.formatted(Formatter.Number()))px"
        }.joined(separator: ", ")
        return "polygon(\(pointsStr))"
    }
}
