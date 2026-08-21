import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TransformFunction: Sendable, Hashable {

    case matrix(a: Number, b: Number, c: Number, d: Number, tx: Number, ty: Number)

    case matrix3d(values: [Number])

    case perspective(Length)

    case rotate(Angle)

    case rotate3d(x: Number, y: Number, z: Number, angle: Angle)

    case rotateX(Angle)

    case rotateY(Angle)

    case rotateZ(Angle)

    case scale(sx: NumberPercentage, sy: NumberPercentage? = nil)

    case scale3d(sx: Number, sy: Number, sz: Number)

    case scaleX(Number)

    case scaleY(Number)

    case scaleZ(Number)

    case skew(Angle, Angle? = nil)

    case skewX(Angle)

    case skewY(Angle)

    case translate(LengthPercentage, LengthPercentage? = nil)

    case translate3d(LengthPercentage, LengthPercentage, Length)

    case translateX(LengthPercentage)

    case translateY(LengthPercentage)

    case translateZ(Length)
}

extension TransformFunction {

    public static func scale(_ sx: NumberPercentage, _ sy: NumberPercentage? = nil) -> Self {
        .scale(sx: sx, sy: sy)
    }

    public static func scale(_ percentage: Percentage) -> Self {
        .scale(sx: .percentage(percentage))
    }

    public static func scale(_ number: Number) -> Self {
        .scale(sx: .number(number))
    }

    public static func scale(_ value: Double) -> Self {
        .scale(sx: .number(Number(value)))
    }

    public static func scale(_ value: Int) -> Self {
        .scale(sx: .number(Number(value)))
    }

    public static func matrix(
        a: Double,
        b: Double,
        c: Double,
        d: Double,
        tx: Double,
        ty: Double
    ) -> Self {
        .matrix(
            a: Number(a),
            b: Number(b),
            c: Number(c),
            d: Number(d),
            tx: Number(tx),
            ty: Number(ty)
        )
    }

    public static func matrix(a: Int, b: Int, c: Int, d: Int, tx: Int, ty: Int) -> Self {
        .matrix(
            a: Number(a),
            b: Number(b),
            c: Number(c),
            d: Number(d),
            tx: Number(tx),
            ty: Number(ty)
        )
    }

    public static func rotate3d(x: Double, y: Double, z: Double, angle: Angle) -> Self {
        .rotate3d(x: Number(x), y: Number(y), z: Number(z), angle: angle)
    }

    public static func rotate3d(x: Int, y: Int, z: Int, angle: Angle) -> Self {
        .rotate3d(x: Number(x), y: Number(y), z: Number(z), angle: angle)
    }

    public static func scale3d(sx: Double, sy: Double, sz: Double) -> Self {
        .scale3d(sx: Number(sx), sy: Number(sy), sz: Number(sz))
    }

    public static func scale3d(sx: Int, sy: Int, sz: Int) -> Self {
        .scale3d(sx: Number(sx), sy: Number(sy), sz: Number(sz))
    }

    public static func scaleX(_ factor: Double) -> Self {
        .scaleX(Number(factor))
    }

    public static func scaleX(_ factor: Int) -> Self {
        .scaleX(Number(factor))
    }

    public static func scaleY(_ factor: Double) -> Self {
        .scaleY(Number(factor))
    }

    public static func scaleY(_ factor: Int) -> Self {
        .scaleY(Number(factor))
    }

    public static func scaleZ(_ factor: Double) -> Self {
        .scaleZ(Number(factor))
    }

    public static func scaleZ(_ factor: Int) -> Self {
        .scaleZ(Number(factor))
    }
}

extension TransformFunction: CustomStringConvertible {

    public var description: String {
        switch self {
        case .matrix(let a, let b, let c, let d, let tx, let ty):
            return "matrix(\(a), \(b), \(c), \(d), \(tx), \(ty))"

        case .matrix3d(let values):
            let valuesString = values.map(\.description).joined(separator: ", ")
            return "matrix3d(\(valuesString))"

        case .perspective(let distance):
            return "perspective(\(distance))"

        case .rotate(let angle):
            return "rotate(\(angle))"

        case .rotate3d(let x, let y, let z, let angle):
            return "rotate3d(\(x), \(y), \(z), \(angle))"

        case .rotateX(let angle):
            return "rotateX(\(angle))"

        case .rotateY(let angle):
            return "rotateY(\(angle))"

        case .rotateZ(let angle):
            return "rotateZ(\(angle))"

        case .scale(let sx, let sy):
            if let sy {
                return "scale(\(sx), \(sy))"
            } else {
                return "scale(\(sx))"
            }

        case .scale3d(let sx, let sy, let sz):
            return "scale3d(\(sx), \(sy), \(sz))"

        case .scaleX(let factor):
            return "scaleX(\(factor))"

        case .scaleY(let factor):
            return "scaleY(\(factor))"

        case .scaleZ(let factor):
            return "scaleZ(\(factor))"

        case .skew(let angleX, let angleY):
            if let angleY {
                return "skew(\(angleX), \(angleY))"
            } else {
                return "skew(\(angleX))"
            }

        case .skewX(let angle):
            return "skewX(\(angle))"

        case .skewY(let angle):
            return "skewY(\(angle))"

        case .translate(let tx, let ty):
            if let ty {
                return "translate(\(tx), \(ty))"
            } else {
                return "translate(\(tx))"
            }

        case .translate3d(let tx, let ty, let tz):
            return "translate3d(\(tx), \(ty), \(tz))"

        case .translateX(let distance):
            return "translateX(\(distance))"

        case .translateY(let distance):
            return "translateY(\(distance))"

        case .translateZ(let distance):
            return "translateZ(\(distance))"
        }
    }
}

extension TransformFunction {

    public static let identity = TransformFunction.matrix(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)

    public static func translate(_ distance: LengthPercentage) -> TransformFunction {
        return .translate(distance, distance)
    }

    public static func translate(_ x: Length, _ y: Length) -> TransformFunction {
        return Self.translate(LengthPercentage.length(x), LengthPercentage.length(y))
    }

    public static func translatePercent(_ x: Percentage, _ y: Percentage) -> TransformFunction {
        return .translate(.percentage(x), .percentage(y))
    }

    public static func translate(_ x: Int, _ y: Int) -> TransformFunction {
        return Self.translate(Length.px(Double(x)), Length.px(Double(y)))
    }

    public static func translateX(_ distance: Length) -> Self {
        .translateX(LengthPercentage.length(distance))
    }

    public static func translateY(_ distance: Length) -> Self {
        .translateY(LengthPercentage.length(distance))
    }

    public static func translate3d(_ x: Length, _ y: Length, _ z: Length) -> Self {
        .translate3d(LengthPercentage.length(x), LengthPercentage.length(y), z)
    }
}
