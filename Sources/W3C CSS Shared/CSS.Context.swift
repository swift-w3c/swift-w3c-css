import Formatter
public import Geometry

extension Geometry.Ball where N == 2, Scalar == Double, Space == W3C_CSS.Space {
    public var css: Context { Context(self) }

    public struct Context {
        let circle: Geometry<Double, W3C_CSS.Space>.Circle

        init(_ circle: Geometry<Double, W3C_CSS.Space>.Circle) {
            self.circle = circle
        }
    }
}

extension Geometry.Ball.Context {
    public var clipPath: String? {
        guard circle.radius.underlying >= 0 else { return nil }
        return
            "circle(\(circle.radius.formatted(Formatter.Number()))px at \(circle.center.x.formatted(Formatter.Number()))px \(circle.center.y.formatted(Formatter.Number()))px)"
    }
}

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C_CSS.Space {
    public var css: Context { Context(self) }
}

extension Geometry.Ellipse where Scalar == Double, Space == W3C_CSS.Space {
    public var css: Context { Context(self) }
}

extension Geometry.Polygon where Scalar == Double, Space == W3C_CSS.Space {
    public var css: Context { Context(self) }
}

extension Geometry.Path where Scalar == Double, Space == W3C_CSS.Space {
    public var css: Context { Context(self) }
}
