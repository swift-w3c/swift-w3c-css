import Formatter
public import Geometry

extension Geometry.Ball where N == 2, Scalar == Double, Space == W3C_CSS.Space {

    public var css: Context { Context(self) }

    public struct Context {
        let circle: Geometry<Double, W3C_CSS.Space>.Circle

        init(_ circle: Geometry<Double, W3C_CSS.Space>.Circle) {
            self.circle = circle
        }

        public var clipPath: String? {
            guard circle.radius.underlying >= 0 else { return nil }
            return
                "circle(\(circle.radius.formatted(Formatter.Number()))px at \(circle.center.x.formatted(Formatter.Number()))px \(circle.center.y.formatted(Formatter.Number()))px)"
        }
    }
}

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C_CSS.Space {

    public var css: Context { Context(self) }

    public struct Context {
        let rectangle: Geometry<Double, W3C_CSS.Space>.Rectangle

        init(_ rectangle: Geometry<Double, W3C_CSS.Space>.Rectangle) {
            self.rectangle = rectangle
        }

        public func inset(referenceWidth: Double, referenceHeight: Double) -> String? {
            guard rectangle.width.underlying >= 0, rectangle.height.underlying >= 0 else {
                return nil
            }

            let top = rectangle.lly.underlying
            let left = rectangle.llx.underlying
            let bottom = referenceHeight - (rectangle.lly.underlying + rectangle.height.underlying)
            let right = referenceWidth - (rectangle.llx.underlying + rectangle.width.underlying)

            return
                "inset(\(top.formatted(Formatter.Number()))px \(right.formatted(Formatter.Number()))px \(bottom.formatted(Formatter.Number()))px \(left.formatted(Formatter.Number()))px)"
        }

        public var xywh: String? {
            guard rectangle.width.underlying >= 0, rectangle.height.underlying >= 0 else {
                return nil
            }
            return
                "xywh(\(rectangle.llx.formatted(Formatter.Number()))px \(rectangle.lly.formatted(Formatter.Number()))px \(rectangle.width.formatted(Formatter.Number()))px \(rectangle.height.formatted(Formatter.Number()))px)"
        }
    }
}

extension Geometry.Ellipse where Scalar == Double, Space == W3C_CSS.Space {

    public var css: Context { Context(self) }

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

extension Geometry.Polygon where Scalar == Double, Space == W3C_CSS.Space {

    public var css: Context { Context(self) }

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

extension Geometry.Path where Scalar == Double, Space == W3C_CSS.Space {

    public var css: Context { Context(self) }

    public struct Context {
        let path: Geometry<Double, W3C_CSS.Space>.Path

        init(_ path: Geometry<Double, W3C_CSS.Space>.Path) {
            self.path = path
        }

        public var clipPath: String {

            var d = ""

            for (subpathIndex, subpath) in path.subpaths.enumerated() {

                if subpathIndex == 0 {
                    d += "M"
                } else {
                    d += " M"
                }
                d +=
                    " \(subpath.startPoint.x.formatted(Formatter.Number())) \(subpath.startPoint.y.formatted(Formatter.Number()))"

                for segment in subpath.segments {
                    switch segment {
                    case .line(let seg):
                        d += " L \(seg.end.x.formatted(Formatter.Number())) \(seg.end.y.formatted(Formatter.Number()))"

                    case .bezier(let bez):

                        switch bez.controlPoints.count {
                        case 2:
                            if let end = bez.controlPoints.last {
                                d += " L \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"
                            }

                        case 3:
                            if bez.controlPoints.count >= 3 {
                                let cp = bez.controlPoints[1]
                                let end = bez.controlPoints[2]
                                d += " Q \(cp.x.formatted(Formatter.Number())) \(cp.y.formatted(Formatter.Number()))"
                                d += " \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"
                            }

                        case 4:
                            if bez.controlPoints.count >= 4 {
                                let cp1 = bez.controlPoints[1]
                                let cp2 = bez.controlPoints[2]
                                let end = bez.controlPoints[3]
                                d += " C \(cp1.x.formatted(Formatter.Number())) \(cp1.y.formatted(Formatter.Number()))"
                                d += " \(cp2.x.formatted(Formatter.Number())) \(cp2.y.formatted(Formatter.Number()))"
                                d += " \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"
                            }

                        default:

                            if let end = bez.controlPoints.last {
                                d += " L \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"
                            }
                        }

                    case .arc(let arc):

                        let end = arc.endPoint
                        d += " L \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"

                    case .ellipticalArc(let arc):

                        let end = arc.endPoint
                        d += " L \(end.x.formatted(Formatter.Number())) \(end.y.formatted(Formatter.Number()))"
                    }
                }

                if subpath.isClosed {
                    d += " Z"
                }
            }

            return "path('\(d)')"
        }
    }
}
