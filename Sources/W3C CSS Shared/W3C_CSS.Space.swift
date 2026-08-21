public import Geometry_Primitives

public typealias GeometryTypeAlias = Geometry

public enum W3C_CSS {
}

extension W3C_CSS {

    public enum Space {}

    public typealias Geometry = GeometryTypeAlias<Double, W3C_CSS.Space>
}

extension W3C_CSS {

    public typealias Circle = W3C_CSS.Geometry.Circle

    public typealias Rectangle = W3C_CSS.Geometry.Rectangle

    public typealias Ellipse = W3C_CSS.Geometry.Ellipse

    public typealias Line = W3C_CSS.Geometry.Line.Segment

    public typealias Polygon = W3C_CSS.Geometry.Polygon

    public typealias Path = W3C_CSS.Geometry.Path

    public typealias Arc = W3C_CSS.Geometry.Arc

    public typealias Bezier = W3C_CSS.Geometry.Bezier

    public typealias Triangle = W3C_CSS.Geometry.Triangle
}

extension W3C_CSS {

    public typealias X = W3C_CSS.Geometry.X

    public typealias Y = W3C_CSS.Geometry.Y

    public typealias Dx = W3C_CSS.Geometry.Dx

    public typealias Dy = W3C_CSS.Geometry.Dy

    public typealias Width = W3C_CSS.Geometry.Width

    public typealias Height = W3C_CSS.Geometry.Height

    public typealias Radius = W3C_CSS.Geometry.Radius

    public typealias Point = W3C_CSS.Geometry.Point<2>

    public typealias Vector = W3C_CSS.Geometry.Vector<2>
}

extension W3C_CSS {

    public typealias AffineTransform = W3C_CSS.Geometry.Transform
}

extension W3C_CSS {

    public typealias EdgeInsets = W3C_CSS.Geometry.Insets
}
