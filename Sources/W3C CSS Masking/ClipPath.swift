public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ClipPath: Property {

    case none

    case url(Url)

    case circle(CircleShape)

    case ellipse(EllipseShape)

    case inset(InsetShape)

    case polygon(PolygonShape)

    case path(CSSString)

    case custom(CSSString)

    case global(Global)

    public init(_ value: CSSString) {
        self = .custom(value)
    }
}

extension ClipPath {
    public static let property: String = "clip-path"
}

public struct CircleShape: Sendable, Hashable {

    public var radius: LengthPercentage

    public var center: Point?

    public init(radius: LengthPercentage, center: Point? = nil) {
        self.radius = radius
        self.center = center
    }
}

public struct EllipseShape: Sendable, Hashable {

    public var radiusX: LengthPercentage

    public var radiusY: LengthPercentage

    public var center: Point?

    public init(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage,
        center: Point? = nil
    ) {
        self.radiusX = radiusX
        self.radiusY = radiusY
        self.center = center
    }
}

public struct InsetShape: Sendable, Hashable {

    public var top: LengthPercentage

    public var right: LengthPercentage

    public var bottom: LengthPercentage

    public var left: LengthPercentage

    public var borderRadius: LengthPercentage?

    public init(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: LengthPercentage? = nil
    ) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
        self.borderRadius = borderRadius
    }

    public init(all: LengthPercentage, borderRadius: LengthPercentage? = nil) {
        self.top = all
        self.right = all
        self.bottom = all
        self.left = all
        self.borderRadius = borderRadius
    }
}

public struct Point: Sendable, Hashable {
    public let x: LengthPercentage
    public let y: LengthPercentage
}

public struct PolygonShape: Sendable, Hashable {

    public var points: [Point]

    public init(points: [Point]) {
        self.points = points
    }
}

extension CircleShape: CustomStringConvertible {
    public var description: String {
        if let center {
            return "circle(\(radius) at \(center.x) \(center.y))"
        } else {
            return "circle(\(radius) )"
        }
    }
}

extension EllipseShape: CustomStringConvertible {
    public var description: String {
        if let center {
            return "ellipse(\(radiusX) \(radiusY) at \(center.x) \(center.y))"
        } else {
            return "ellipse(\(radiusX) \(radiusY) )"
        }
    }
}

extension InsetShape: CustomStringConvertible {
    public var description: String {
        let insetPart = "inset(\(top) \(right) \(bottom) \(left))"
        if let borderRadius {
            return "\(insetPart) round \(borderRadius)"
        } else {
            return insetPart
        }
    }
}

extension PolygonShape: CustomStringConvertible {
    public var description: String {
        let pointsString = points.map { "\($0.x) \($0.y)" }.joined(separator: ", ")
        return "polygon(\(pointsString))"
    }
}

extension ClipPath: CustomStringConvertible {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .url(let url):
            return url.description

        case .circle(let shape):
            return shape.description

        case .ellipse(let shape):
            return shape.description

        case .inset(let shape):
            return shape.description

        case .polygon(let shape):
            return shape.description

        case .path(let path):
            return "path('\(path)')"

        case .custom(let value):
            return value.description

        case .global(let global):
            return global.description
        }
    }
}

extension ClipPath {

    public static func circle(_ radius: LengthPercentage) -> ClipPath {
        .circle(CircleShape(radius: radius))
    }

    public static func circle(radius: LengthPercentage) -> ClipPath {
        .circle(CircleShape(radius: radius))
    }

    public static func circle(
        _ radius: LengthPercentage,
        at center: Point
    ) -> ClipPath {
        .circle(CircleShape(radius: radius, center: center))
    }

    public static func ellipse(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage
    ) -> ClipPath {
        .ellipse(EllipseShape(radiusX: radiusX, radiusY: radiusY))
    }

    public static func ellipse(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage,
        center: Point
    ) -> ClipPath {
        .ellipse(EllipseShape(radiusX: radiusX, radiusY: radiusY, center: center))
    }

    public static func inset(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: LengthPercentage? = nil
    ) -> ClipPath {
        .inset(
            InsetShape(
                top: top,
                right: right,
                bottom: bottom,
                left: left,
                borderRadius: borderRadius
            )
        )
    }

    public static func inset(
        all: LengthPercentage,
        borderRadius: LengthPercentage? = nil
    ) -> ClipPath {
        .inset(InsetShape(all: all, borderRadius: borderRadius))
    }

    public static func polygon(points: [Point]) -> ClipPath {
        .polygon(PolygonShape(points: points))
    }
}
