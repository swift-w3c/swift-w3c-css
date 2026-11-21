public import W3C
public import Geometry

public typealias GeometryTypeAlias = Geometry

extension W3C {
    public enum CSS {}
}

extension W3C.CSS {

    public enum Space {}

    public typealias Geometry = GeometryTypeAlias<Double, W3C.CSS.Space>
}

extension W3C.CSS {

    public typealias Circle = W3C.CSS.Geometry.Circle

    public typealias Rectangle = W3C.CSS.Geometry.Rectangle

    public typealias Ellipse = W3C.CSS.Geometry.Ellipse

    public typealias Line = W3C.CSS.Geometry.Line.Segment

    public typealias Polygon = W3C.CSS.Geometry.Polygon

    public typealias Path = W3C.CSS.Geometry.Path

    public typealias Arc = W3C.CSS.Geometry.Arc

    public typealias Bezier = W3C.CSS.Geometry.Bezier

    public typealias Triangle = W3C.CSS.Geometry.Triangle
}

extension W3C.CSS {

    public typealias X = W3C.CSS.Geometry.X

    public typealias Y = W3C.CSS.Geometry.Y

    public typealias Dx = W3C.CSS.Geometry.Dx

    public typealias Dy = W3C.CSS.Geometry.Dy

    public typealias Width = W3C.CSS.Geometry.Width

    public typealias Height = W3C.CSS.Geometry.Height

    public typealias Radius = W3C.CSS.Geometry.Radius

    public typealias Point = W3C.CSS.Geometry.Point<2>

    public typealias Vector = W3C.CSS.Geometry.Vector<2>
}

extension W3C.CSS {

    public typealias AffineTransform = Linear<Double, W3C.CSS.Space>.Matrix<3, 3>
}

extension W3C.CSS {

    public typealias EdgeInsets = W3C.CSS.Geometry.Insets
}
