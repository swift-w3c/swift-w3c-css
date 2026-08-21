import W3C_CSS_Masking
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OffsetPath: Property {

    case none

    case url(Url)

    case ray(angle: Angle, size: RaySize? = nil, contain: Bool = false, position: Position? = nil)

    case shape(BasicShape)

    case coordBox(CoordBox)

    case coordBoxShape(CoordBox, BasicShape)

    case global(Global)
}

extension OffsetPath {
    public static let property: String = "offset-path"
}

extension OffsetPath {

    public enum RaySize: Sendable, Hashable {

        case closestSide

        case closestCorner

        case farthestSide

        case farthestCorner

        case sides
    }

    public enum CoordBox: Sendable, Hashable {

        case borderBox

        case paddingBox

        case contentBox

        case fillBox

        case strokeBox

        case viewBox
    }
}

extension OffsetPath {

    public static func path(_ pathData: String, fillRule: BasicShape.FillRule? = nil) -> Self {
        .shape(.path(fillRule: fillRule, pathData: pathData))
    }

    public static func circle(
        _ radius: LengthPercentage? = nil,
        at position: Position? = nil
    ) -> Self {
        let shapeRadius = radius.map { BasicShape.ShapeRadius.lengthPercentage($0) }
        return .shape(.circle(radius: shapeRadius, at: position))
    }

    public static func ellipse(
        radiusX: LengthPercentage? = nil,
        radiusY: LengthPercentage? = nil,
        at position: Position? = nil
    ) -> Self {
        let rx = radiusX.map { BasicShape.ShapeRadius.lengthPercentage($0) }
        let ry = radiusY.map { BasicShape.ShapeRadius.lengthPercentage($0) }
        return .shape(.ellipse(radiusX: rx, radiusY: ry, at: position))
    }

    public static func polygon(
        fillRule: BasicShape.FillRule? = nil,
        points: [(LengthPercentage, LengthPercentage)]
    ) -> Self {
        let polygonPoints = points.map { BasicShape.PolygonPoint($0.0, $0.1) }
        return .shape(.polygon(fillRule: fillRule, points: polygonPoints))
    }

    public static func inset(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: String? = nil
    ) -> Self {
        .shape(
            .inset(top: top, right: right, bottom: bottom, left: left, borderRadius: borderRadius)
        )
    }
}

extension OffsetPath: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .url(let url):
            return url.description

        case .ray(let angle, let size, let contain, let position):
            var result = "ray(\(angle)"
            if let s = size {
                result += " \(s.description)"
            }
            if contain {
                result += " contain"
            }
            if let p = position {
                result += " at \(p)"
            }
            result += ")"
            return result

        case .shape(let shape):
            return shape.description

        case .coordBox(let box):
            return box.description

        case .coordBoxShape(let box, let shape):
            return "\(box.description) \(shape.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension OffsetPath.RaySize: CustomStringConvertible {

    public var description: String {
        switch self {
        case .closestSide:
            return "closest-side"

        case .closestCorner:
            return "closest-corner"

        case .farthestSide:
            return "farthest-side"

        case .farthestCorner:
            return "farthest-corner"

        case .sides:
            return "sides"
        }
    }
}

extension OffsetPath.CoordBox: CustomStringConvertible {

    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"

        case .paddingBox:
            return "padding-box"

        case .contentBox:
            return "content-box"

        case .fillBox:
            return "fill-box"

        case .strokeBox:
            return "stroke-box"

        case .viewBox:
            return "view-box"
        }
    }
}
