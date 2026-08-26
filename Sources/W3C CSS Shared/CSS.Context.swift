import Format_Primitive
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
                "circle(\(circle.radius.formatted(.number))px at \(circle.center.x.formatted(.number))px \(circle.center.y.formatted(.number))px)"
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
                "inset(\(top.formatted(.number))px \(right.formatted(.number))px \(bottom.formatted(.number))px \(left.formatted(.number))px)"
        }

        public var xywh: String? {
            guard rectangle.width.underlying >= 0, rectangle.height.underlying >= 0 else {
                return nil
            }
            return
                "xywh(\(rectangle.llx.formatted(.number))px \(rectangle.lly.formatted(.number))px \(rectangle.width.formatted(.number))px \(rectangle.height.formatted(.number))px)"
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
                "ellipse(\(ellipse.semiMajor.formatted(.number))px \(ellipse.semiMinor.formatted(.number))px at \(ellipse.center.x.formatted(.number))px \(ellipse.center.y.formatted(.number))px)"
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
                "\(vertex.x.formatted(.number))px \(vertex.y.formatted(.number))px"
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
                    " \(subpath.startPoint.x.formatted(.number)) \(subpath.startPoint.y.formatted(.number))"

                for segment in subpath.segments {
                    switch segment {
                    case .line(let seg):
                        d += " L \(seg.end.x.formatted(.number)) \(seg.end.y.formatted(.number))"

                    case .bezier(let bez):

                        switch bez.controlPoints.count {
                        case 2:
                            if let end = bez.controlPoints.last {
                                d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }

                        case 3:
                            if bez.controlPoints.count >= 3 {
                                let cp = bez.controlPoints[1]
                                let end = bez.controlPoints[2]
                                d += " Q \(cp.x.formatted(.number)) \(cp.y.formatted(.number))"
                                d += " \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }

                        case 4:
                            if bez.controlPoints.count >= 4 {
                                let cp1 = bez.controlPoints[1]
                                let cp2 = bez.controlPoints[2]
                                let end = bez.controlPoints[3]
                                d += " C \(cp1.x.formatted(.number)) \(cp1.y.formatted(.number))"
                                d += " \(cp2.x.formatted(.number)) \(cp2.y.formatted(.number))"
                                d += " \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }

                        default:

                            if let end = bez.controlPoints.last {
                                d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"
                            }
                        }

                    case .arc(let arc):

                        let end = arc.endPoint
                        d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"

                    case .ellipticalArc(let arc):

                        let end = arc.endPoint
                        d += " L \(end.x.formatted(.number)) \(end.y.formatted(.number))"
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
