import Formatter
public import Geometry


extension Geometry.Polygon where Scalar == Double, Space == W3C_CSS.Space {
    public struct Context {
        let polygon: Geometry<Double, W3C_CSS.Space>.Polygon

        init(_ polygon: Geometry<Double, W3C_CSS.Space>.Polygon) {
            self.polygon = polygon
        }

        public var clipPath: String {
            let pointsStr = polygon.vertices.map { vertex in
                "\(vertex.x.formatted(Formatter.Number()))px \(vertex.y.formatted(Formatter.Number()))px"
            }.joined(separator: ", ")
            return "polygon(\(pointsStr))"
        }
    }
}
