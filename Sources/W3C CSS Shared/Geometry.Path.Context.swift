import Formatter
public import Geometry


extension Geometry.Path where Scalar == Double, Space == W3C_CSS.Space {
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
