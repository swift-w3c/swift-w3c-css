//
//  W3C_CSS.Space.swift
//  swift-w3c-css
//
//  CSS coordinate space marker for typed geometry operations.
//

public import Geometry_Primitives

public typealias GeometryTypeAlias = Geometry

/// Marker type for CSS coordinate space.
///
/// CSS uses a coordinate system where:
/// - Origin (0,0) is at the top-left corner
/// - X-axis increases to the right
/// - Y-axis increases downward (same as SVG)
///
/// This space marker enables typed geometry operations that distinguish
/// between different coordinate systems.
public enum W3C_CSS {
}

extension W3C_CSS {
    /// CSS coordinate space marker.
    public enum Space {}

    public typealias Geometry = GeometryTypeAlias<Double, W3C_CSS.Space>
}

// MARK: - Shape Type Aliases

extension W3C_CSS {
    /// A circle in CSS coordinate space.
    public typealias Circle = W3C_CSS.Geometry.Circle

    /// A rectangle in CSS coordinate space.
    public typealias Rectangle = W3C_CSS.Geometry.Rectangle

    /// An ellipse in CSS coordinate space.
    public typealias Ellipse = W3C_CSS.Geometry.Ellipse

    /// A line segment in CSS coordinate space.
    public typealias Line = W3C_CSS.Geometry.Line.Segment

    /// A polygon in CSS coordinate space.
    public typealias Polygon = W3C_CSS.Geometry.Polygon

    /// A path in CSS coordinate space.
    public typealias Path = W3C_CSS.Geometry.Path

    /// An arc in CSS coordinate space.
    public typealias Arc = W3C_CSS.Geometry.Arc

    /// A bezier curve in CSS coordinate space.
    public typealias Bezier = W3C_CSS.Geometry.Bezier

    /// A triangle in CSS coordinate space.
    public typealias Triangle = W3C_CSS.Geometry.Triangle
}

// MARK: - Coordinate Type Aliases

extension W3C_CSS {
    /// X coordinate in CSS space.
    public typealias X = W3C_CSS.Geometry.X

    /// Y coordinate in CSS space.
    public typealias Y = W3C_CSS.Geometry.Y

    /// X displacement in CSS space.
    public typealias Dx = W3C_CSS.Geometry.Dx

    /// Y displacement in CSS space.
    public typealias Dy = W3C_CSS.Geometry.Dy

    /// Width extent in CSS space.
    public typealias Width = W3C_CSS.Geometry.Width

    /// Height extent in CSS space.
    public typealias Height = W3C_CSS.Geometry.Height

    /// Radius in CSS space.
    public typealias Radius = W3C_CSS.Geometry.Radius

    /// A 2D point in CSS coordinate space.
    public typealias Point = W3C_CSS.Geometry.Point<2>

    /// A 2D displacement vector in CSS coordinate space.
    public typealias Vector = W3C_CSS.Geometry.Vector<2>
}

// MARK: - Transform Type Aliases

extension W3C_CSS {
    /// An affine transformation matrix in CSS coordinate space.
    public typealias AffineTransform = W3C_CSS.Geometry.Transform
}

// MARK: - Edge Insets

extension W3C_CSS {
    /// Edge insets (padding/margin) in CSS coordinate space.
    public typealias EdgeInsets = W3C_CSS.Geometry.Insets
}
