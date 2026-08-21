public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ShapeOutside: Property {

    case none

    case box(ShapeBox)

    case shape(BasicShape)

    case shapeWithBox(BasicShape, ShapeBox)

    case image(url: Url)

    case global(Global)
}

extension ShapeOutside {
    public static let property: String = "shape-outside"

    public enum ShapeBox: String, Sendable {

        case marginBox = "margin-box"

        case borderBox = "border-box"

        case paddingBox = "padding-box"

        case contentBox = "content-box"
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .box(let box):
            return box.rawValue

        case .shape(let shape):
            return shape.description

        case .shapeWithBox(let shape, let box):
            return "\(shape.description) \(box.rawValue)"

        case .image(let url):
            return url.description

        case .global(let global):
            return global.description
        }
    }

    public static func circle(radius: LengthPercentage, box: ShapeBox? = nil) -> Self {
        let shape = BasicShape.circle(radius: .lengthPercentage(radius), at: nil)
        return box != nil ? .shapeWithBox(shape, box!) : .shape(shape)
    }

    public static func ellipse(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage,
        box: ShapeBox? = nil
    ) -> Self {
        let shape = BasicShape.ellipse(
            radiusX: .lengthPercentage(radiusX),
            radiusY: .lengthPercentage(radiusY),
            at: nil
        )
        return box != nil ? .shapeWithBox(shape, box!) : .shape(shape)
    }

    public static func polygon(_ points: [(Double, Double)], box: ShapeBox? = nil) -> Self {
        let polygonPoints = points.map { x, y -> (LengthPercentage, LengthPercentage) in
            (
                LengthPercentage.percentage(.init(floatLiteral: x)),
                .percentage(.init(floatLiteral: y))
            )
        }

        let shape = BasicShape.polygon(points: polygonPoints)
        return box != nil ? .shapeWithBox(shape, box!) : .shape(shape)
    }
}
