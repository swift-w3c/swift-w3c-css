//
//  CSS.Context.swift
//  swift-w3c-css
//
//  Context wrappers that convert geometry types to CSS value strings.
//

public import Foundation
public import Formatting_Primitives
public import Geometry_Primitives

/// Helper for formatting numbers in CSS output.
private func formatNumber(_ value: Double) -> String {
    value.formatted(.number)
}

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
            guard circle.radius.rawValue >= 0 else { return nil }
            return "circle(\(formatNumber(circle.radius.rawValue))px at \(formatNumber(circle.center.x.rawValue))px \(formatNumber(circle.center.y.rawValue))px)"
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
            guard rectangle.width.rawValue >= 0, rectangle.height.rawValue >= 0 else { return nil }

            let top = rectangle.lly.rawValue
            let left = rectangle.llx.rawValue
            let bottom = referenceHeight - (rectangle.lly.rawValue + rectangle.height.rawValue)
            let right = referenceWidth - (rectangle.llx.rawValue + rectangle.width.rawValue)

            return "inset(\(formatNumber(top))px \(formatNumber(right))px \(formatNumber(bottom))px \(formatNumber(left))px)"
        }

        /// Convert to a CSS clip-path xywh value string.
        ///
        /// Returns `nil` if width or height is negative.
        ///
        /// Example output: `"xywh(10px 20px 200px 100px)"`
        public var xywh: String? {
            guard rectangle.width.rawValue >= 0, rectangle.height.rawValue >= 0 else { return nil }
            return "xywh(\(formatNumber(rectangle.llx.rawValue))px \(formatNumber(rectangle.lly.rawValue))px \(formatNumber(rectangle.width.rawValue))px \(formatNumber(rectangle.height.rawValue))px)"
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
            guard ellipse.semiMajor.rawValue >= 0, ellipse.semiMinor.rawValue >= 0 else { return nil }
            return "ellipse(\(formatNumber(ellipse.semiMajor.rawValue))px \(formatNumber(ellipse.semiMinor.rawValue))px at \(formatNumber(ellipse.center.x.rawValue))px \(formatNumber(ellipse.center.y.rawValue))px)"
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
                "\(formatNumber(vertex.x.rawValue))px \(formatNumber(vertex.y.rawValue))px"
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
                d += " \(formatNumber(subpath.startPoint.x.rawValue)) \(formatNumber(subpath.startPoint.y.rawValue))"

                // Add segments
                for segment in subpath.segments {
                    switch segment {
                    case .line(let seg):
                        d += " L \(formatNumber(seg.end.x.rawValue)) \(formatNumber(seg.end.y.rawValue))"

                    case .bezier(let bez):
                        // Convert bezier to path commands based on degree
                        switch bez.controlPoints.count {
                        case 2: // Linear (should use line instead, but handle it)
                            if let end = bez.controlPoints.last {
                                d += " L \(formatNumber(end.x.rawValue)) \(formatNumber(end.y.rawValue))"
                            }
                        case 3: // Quadratic
                            if bez.controlPoints.count >= 3 {
                                let cp = bez.controlPoints[1]
                                let end = bez.controlPoints[2]
                                d += " Q \(formatNumber(cp.x.rawValue)) \(formatNumber(cp.y.rawValue))"
                                d += " \(formatNumber(end.x.rawValue)) \(formatNumber(end.y.rawValue))"
                            }
                        case 4: // Cubic
                            if bez.controlPoints.count >= 4 {
                                let cp1 = bez.controlPoints[1]
                                let cp2 = bez.controlPoints[2]
                                let end = bez.controlPoints[3]
                                d += " C \(formatNumber(cp1.x.rawValue)) \(formatNumber(cp1.y.rawValue))"
                                d += " \(formatNumber(cp2.x.rawValue)) \(formatNumber(cp2.y.rawValue))"
                                d += " \(formatNumber(end.x.rawValue)) \(formatNumber(end.y.rawValue))"
                            }
                        default:
                            // Higher-degree beziers: approximate with cubic segments
                            // For now, just draw to end point
                            if let end = bez.controlPoints.last {
                                d += " L \(formatNumber(end.x.rawValue)) \(formatNumber(end.y.rawValue))"
                            }
                        }

                    case .arc(let arc):
                        // Approximate arc with line to endpoint for simplicity
                        // (Full arc support would require SVG arc command conversion)
                        let end = arc.endPoint
                        d += " L \(formatNumber(end.x.rawValue)) \(formatNumber(end.y.rawValue))"

                    case .ellipticalArc(let arc):
                        // Approximate with line to endpoint
                        let end = arc.endPoint
                        d += " L \(formatNumber(end.x.rawValue)) \(formatNumber(end.y.rawValue))"
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
