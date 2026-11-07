import Formatter
public import Geometry


extension Geometry.Ellipse where Scalar == Double, Space == W3C_CSS.Space {
    public struct Context {
        let ellipse: Geometry<Double, W3C_CSS.Space>.Ellipse

        init(_ ellipse: Geometry<Double, W3C_CSS.Space>.Ellipse) {
            self.ellipse = ellipse
        }

        public var clipPath: String? {
            guard ellipse.semiMajor.underlying >= 0, ellipse.semiMinor.underlying >= 0 else {
                return nil
            }
            return
                "ellipse(\(ellipse.semiMajor.formatted(Formatter.Number()))px \(ellipse.semiMinor.formatted(Formatter.Number()))px at \(ellipse.center.x.formatted(Formatter.Number()))px \(ellipse.center.y.formatted(Formatter.Number()))px)"
        }
    }
}
