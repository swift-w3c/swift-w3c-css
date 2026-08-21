public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Transform: Property {

    case none

    case function(TransformFunction)

    case compound([TransformFunction])

    case global(Global)
}

extension Transform {
    public static let property: String = "transform"
}

extension Transform {

    public static func matrix(
        a: Number,
        b: Number,
        c: Number,
        d: Number,
        tx: Number,
        ty: Number
    ) -> Transform {
        .function(.matrix(a: a, b: b, c: c, d: d, tx: tx, ty: ty))
    }

    public static func matrix3d(_ values: [Number]) -> Transform {
        .function(.matrix3d(values: values))
    }

    public static func perspective(_ distance: Length) -> Transform {
        .function(.perspective(distance))
    }

    public static func rotate(_ angle: Angle) -> Transform {
        .function(.rotate(angle))
    }

    public static func rotate3d(x: Number, y: Number, z: Number, angle: Angle) -> Transform {
        .function(.rotate3d(x: x, y: y, z: z, angle: angle))
    }

    public static func rotateX(_ angle: Angle) -> Transform {
        .function(.rotateX(angle))
    }

    public static func rotateY(_ angle: Angle) -> Transform {
        .function(.rotateY(angle))
    }

    public static func rotateZ(_ angle: Angle) -> Transform {
        .function(.rotateZ(angle))
    }

    public static func scale(_ sx: NumberPercentage, _ sy: NumberPercentage? = nil) -> Transform {
        .function(.scale(sx, sy))
    }

    public static func scale3d(x: Number, y: Number, z: Number) -> Transform {
        .function(.scale3d(sx: x, sy: y, sz: z))
    }

    public static func scaleX(_ factor: Number) -> Transform {
        .function(.scaleX(factor))
    }

    public static func scaleY(_ factor: Number) -> Transform {
        .function(.scaleY(factor))
    }

    public static func scaleZ(_ factor: Number) -> Transform {
        .function(.scaleZ(factor))
    }

    public static func skew(_ angleX: Angle, _ angleY: Angle? = nil) -> Transform {
        .function(.skew(angleX, angleY))
    }

    public static func skewX(_ angle: Angle) -> Transform {
        .function(.skewX(angle))
    }

    public static func skewY(_ angle: Angle) -> Transform {
        .function(.skewY(angle))
    }

    public static func translate(_ tx: LengthPercentage, _ ty: LengthPercentage? = nil) -> Transform
    {
        .function(.translate(tx, ty))
    }

    public static func translate3d(x: LengthPercentage, y: LengthPercentage, z: Length) -> Transform
    {
        .function(.translate3d(x, y, z))
    }

    public static func translateX(_ distance: LengthPercentage) -> Transform {
        .function(.translateX(distance))
    }

    public static func translateY(_ distance: LengthPercentage) -> Transform {
        .function(.translateY(distance))
    }

    public static func translateZ(_ distance: Length) -> Transform {
        .function(.translateZ(distance))
    }
}

extension Transform: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .function(let function):
            return function.description

        case .compound(let functions):
            return functions.map { $0.description }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension Transform {

    public static func + (lhs: Transform, rhs: Transform) -> Transform {
        let functions: [TransformFunction] = {
            switch (lhs, rhs) {
            case (.none, _):
                return transformFunctions(from: rhs)

            case (_, .none):
                return transformFunctions(from: lhs)

            case (.global, _), (_, .global):

                return transformFunctions(from: lhs)

            default:
                return transformFunctions(from: lhs) + transformFunctions(from: rhs)
            }
        }()

        return .compound(functions)
    }

    private static func transformFunctions(from transform: Transform) -> [TransformFunction] {
        switch transform {
        case .none:
            return []

        case .function(let function):
            return [function]

        case .compound(let functions):
            return functions

        case .global:
            return []
        }
    }
}
