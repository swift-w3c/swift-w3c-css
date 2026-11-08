import Formatter
public import Geometry

extension Geometry.Orthotope where N == 2, Scalar == Double, Space == W3C_CSS.Space {
    public struct Context {
        let rectangle: Geometry<Double, W3C_CSS.Space>.Rectangle

        init(_ rectangle: Geometry<Double, W3C_CSS.Space>.Rectangle) {
            self.rectangle = rectangle
        }
    }
}

extension Geometry.Orthotope.Context {
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
