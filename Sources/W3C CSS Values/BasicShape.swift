import W3C_CSS_Shared

public enum BasicShape: Sendable, Hashable {

    case inset(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: String?
    )

    case xywh(
        x: LengthPercentage,
        y: LengthPercentage,
        width: LengthPercentage,
        height: LengthPercentage,
        borderRadius: String?
    )

    case rect(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: String?
    )

    case circle(radius: ShapeRadius?, at: Position?)

    case ellipse(radiusX: ShapeRadius?, radiusY: ShapeRadius?, at: Position?)

    case polygon(fillRule: FillRule? = nil, points: [PolygonPoint])

    case path(fillRule: FillRule? = nil, pathData: String)
}

extension BasicShape: CustomStringConvertible {

    public var description: String {
        switch self {
        case .inset(let top, let right, let bottom, let left, let borderRadius):
            let insetValues = "\(top) \(right) \(bottom) \(left)"
            if let radius = borderRadius {
                return "inset(\(insetValues) round \(radius))"
            } else {
                return "inset(\(insetValues))"
            }

        case .xywh(let x, let y, let width, let height, let borderRadius):
            let values = "\(x) \(y) \(width) \(height)"
            if let radius = borderRadius {
                return "xywh(\(values) round \(radius))"
            } else {
                return "xywh(\(values))"
            }

        case .rect(let top, let right, let bottom, let left, let borderRadius):
            let values = "\(top) \(right) \(bottom) \(left)"
            if let radius = borderRadius {
                return "rect(\(values) round \(radius))"
            } else {
                return "rect(\(values))"
            }

        case .circle(let radius, let position):
            var result = "circle("
            if let r = radius {
                result += r.description
            }
            if let pos = position {
                result += " at \(pos)"
            }
            result += ")"
            return result

        case .ellipse(let rx, let ry, let position):
            var result = "ellipse("
            if let radiusX = rx, let radiusY = ry {
                result += "\(radiusX) \(radiusY)"
            }
            if let pos = position {
                result += " at \(pos)"
            }
            result += ")"
            return result

        case .polygon(let fillRule, let points):
            var result = "polygon("
            if let rule = fillRule {
                result += "\(rule.rawValue), "
            }
            let pointsStr = points.map { "\($0.x) \($0.y)" }.joined(separator: ", ")
            result += pointsStr + ")"
            return result

        case .path(let fillRule, let pathData):
            var result = "path("
            if let rule = fillRule {
                result += "\(rule.rawValue), "
            }
            result += "\"\(pathData)\")"
            return result
        }
    }
}

extension BasicShape.ShapeRadius: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .closestSide:
            return "closest-side"

        case .farthestSide:
            return "farthest-side"
        }
    }
}

extension BasicShape {

    public enum FillRule: String, Sendable, Hashable {

        case nonzero

        case evenodd
    }

    public enum ShapeRadius: Sendable, Hashable, LengthPercentageConvertible {
        case lengthPercentage(LengthPercentage)

        case closestSide

        case farthestSide
    }

    public struct PolygonPoint: Sendable, Hashable {

        public let x: LengthPercentage

        public let y: LengthPercentage

        public init(_ x: LengthPercentage, _ y: LengthPercentage) {
            self.x = x
            self.y = y
        }
    }
}

extension BasicShape {

    public static func polygon(
        fillRule: FillRule? = nil,
        points: [(LengthPercentage, LengthPercentage)]
    ) -> Self {
        let polygonPoints = points.map { PolygonPoint($0.0, $0.1) }
        return .polygon(fillRule: fillRule, points: polygonPoints)
    }
}
