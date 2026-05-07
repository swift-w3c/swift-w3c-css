//
//  CSS.Context.swift
//  swift-w3c-css
//
//  Context wrappers that convert geometry types to CSS value strings.
//

public import Format_Primitives
public import Geometry_Primitives

// MARK: - Circle Context

extension Geometry.Ball where N == 2, Scalar == Double, Space == W3C_CSS.Space {
    /// Access CSS-specific functionality for this circle.
    public var css: Context { Context(self) }

    /// Context wrapper providing CSS value conversion.
    public struct Context {
        let circle: Geometry<Double, W3C_CSS.Space>.Circle

        init(_ circle: Geometry<Double, W3C_CSS.Space>.Circle) {
            self.circle = circle
        }

        /// Convert to a CSS clip-path circle value string.
        ///
        /// Returns `nil` if the radius is negative.
        ///
        /// Example output: `"circle(50px at 100px 100px)"`
        public var clipPath: String? {
            guard circle.radius.underlying >= 0 else { return nil }
            return "circle(\(circle.radius.formatted(.number))px at \(circle.center.x.formatted(.number))px \(circle.center.y.formatted(.number))px)"
        }
    }
}

// MARK: - Rectangle Context

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C_CSS.Space {
    /// Access CSS-specific functionality for this rectangle.
    public var css: Context { Context(self) }

    /// Context wrapper providing CSS value conversion.
    public struct Context {
        let rectangle: Geometry<Double, W3C_CSS.Space>.Rectangle

        init(_ rectangle: Geometry<Double, W3C_CSS.Space>.Rectangle) {
            self.rectangle = rectangle
        }

        /// Convert to a CSS clip-path inset value string.
        ///
        /// Returns `nil` if width or height is negative.
        ///
        /// Note: CSS inset() uses distances from edges, not coordinates.
        /// This assumes a reference box and computes insets accordingly.
        public func inset(referenceWidth: Double, referenceHeight: Double) -> String? {
            guard rectangle.width.underlying >= 0, rectangle.height.underlying >= 0 else { return nil }

            let top = rectangle.lly.underlying
            let left = rectangle.llx.underlying
            let bottom = referenceHeight - (rectangle.lly.underlying + rectangle.height.underlying)
            let right = referenceWidth - (rectangle.llx.underlying + rectangle.width.underlying)

            return "inset(\(top.formatted(.number))px \(right.formatted(.number))px \(bottom.formatted(.number))px \(left.formatted(.number))px)"
        }

        /// Convert to a CSS clip-path xywh value string.
        ///
        /// Returns `nil` if width or height is negative.
        ///
        /// Example output: `"xywh(10px 20px 200px 100px)"`
        public var xywh: String? {
            guard rectangle.width.underlying >= 0, rectangle.height.underlying >= 0 else { return nil }
            return "xywh(\(rectangle.llx.formatted(.number))px \(rectangle.lly.formatted(.number))px \(rectangle.width.formatted(.number))px \(rectangle.height.formatted(.number))px)"
        }
    }
}

// MARK: - Ellipse Context

extension Geometry.Ellipse where Scalar == Double, Space == W3C_CSS.Space {
    /// Access CSS-specific functionality for this ellipse.
    public var css: Context { Context(self) }

    /// Context wrapper providing CSS value conversion.
    public struct Context {
        let ellipse: Geometry<Double, W3C_CSS.Space>.Ellipse

        init(_ ellipse: Geometry<Double, W3C_CSS.Space>.Ellipse) {
            self.ellipse = ellipse
        }

        /// Convert to a CSS clip-path ellipse value string.
        ///
        /// Returns `nil` if either radius is negative.
        ///
        /// Example output: `"ellipse(100px 50px at 200px 150px)"`
        public var clipPath: String? {
            guard ellipse.semiMajor.underlying >= 0, ellipse.semiMinor.underlying >= 0 else { return nil }
            return "ellipse(\(ellipse.semiMajor.formatted(.number))px \(ellipse.semiMinor.formatted(.number))px at \(ellipse.center.x.formatted(.number))px \(ellipse.center.y.formatted(.number))px)"
        }
    }
}

// MARK: - Polygon Context

extension Geometry.Polygon where Scalar == Double, Space == W3C_CSS.Space {
    /// Access CSS-specific functionality for this polygon.
    public var css: Context { Context(self) }

    /// Context wrapper providing CSS value conversion.
    public struct Context {
        let polygon: Geometry<Double, W3C_CSS.Space>.Polygon

        init(_ polygon: Geometry<Double, W3C_CSS.Space>.Polygon) {
            self.polygon = polygon
        }

        /// Convert to a CSS clip-path polygon value string.
        ///
        /// Example output: `"polygon(0px 0px, 100px 0px, 100px 100px, 0px 100px)"`
        public var clipPath: String {
            let pointsStr = polygon.vertices.map { vertex in
                "\(vertex.x.formatted(.number))px \(vertex.y.formatted(.number))px"
            }.joined(separator: ", ")
            return "polygon(\(pointsStr))"
        }
    }
}

// MARK: - Path Context

extension Geometry.Path where Scalar == Double, Space == W3C_CSS.Space {
    /// Access CSS-specific functionality for this path.
    public var css: Context { Context(self) }

    /// Context wrapper providing CSS value conversion.
    public struct Context {
        let path: Geometry<Double, W3C_CSS.Space>.Path

        init(_ path: Geometry<Double, W3C_CSS.Space>.Path) {
            self.path = path
        }

        /// Convert to a CSS clip-path path value string.
        ///
        /// Example output: `"path('M 0 0 L 100 0 L 100 100 L 0 100 Z')"`
        public var clipPath: String {
            // Generate SVG path data from the geometry path
            var d = ""

            for (subpathIndex, subpath) in path.subpaths.enumerated() {
                // Move to start point
                if subpathIndex == 0 {
                    d += "M"
                } else {
                    d += " M"
                }
                d += " \(subpath.startPoint.x.formatted(.number)) \(subpath.startPoint.y.formatted(.number))"

                // Add segments
                for segment in subpath.segments {
                    switch segment {
                    case .line(let seg):
                        d += " L \(seg.end.x.formatted(.number)) \(seg.end.y.formatted(.number))"

                    case .bezier(let bez):
                        // Convert bezier to path commands based on degree
                        switch bez.controlPoints.count {
                        case 2: // Linear (should use line instead, but handle it)
                            if let end = bez.controlPoints.last {
                                d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }
                        case 3: // Quadratic
                            if bez.controlPoints.count >= 3 {
                                let cp = bez.controlPoints[1]
                                let end = bez.controlPoints[2]
                                d += " Q \(cp.x.formatted(.number)) \(cp.y.formatted(.number))"
                                d += " \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }
                        case 4: // Cubic
                            if bez.controlPoints.count >= 4 {
                                let cp1 = bez.controlPoints[1]
                                let cp2 = bez.controlPoints[2]
                                let end = bez.controlPoints[3]
                                d += " C \(cp1.x.formatted(.number)) \(cp1.y.formatted(.number))"
                                d += " \(cp2.x.formatted(.number)) \(cp2.y.formatted(.number))"
                                d += " \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }
                        default:
                            // Higher-degree beziers: approximate with cubic segments
                            // For now, just draw to end point
                            if let end = bez.controlPoints.last {
                                d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }
                        }

                    case .arc(let arc):
                        // Approximate arc with line to endpoint for simplicity
                        // (Full arc support would require SVG arc command conversion)
                        let end = arc.endPoint
                        d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"

                    case .ellipticalArc(let arc):
                        // Approximate with line to endpoint
                        let end = arc.endPoint
                        d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                    }
                }

                // Close path if needed
                if subpath.isClosed {
                    d += " Z"
                }
            }

            return "path('\(d)')"
        }
    }
}
