import Format_Primitive

public enum Hue: Sendable, Hashable, AngleConvertible {

    case number(Number)

    case angle(Angle)
}

extension Hue {

    public func normalizedDegrees() -> Double {
        let degrees: Double

        switch self {
        case .number(let number):
            degrees = number.value

        case .angle(let angle):

            switch angle {
            case .deg(let value):
                degrees = value

            case .grad(let value):
                degrees = value * 0.9

            case .rad(let value):
                degrees = value * 180.0 / .pi

            case .turn(let value):
                degrees = value * 360.0
            }
        }

        return ((degrees.truncatingRemainder(dividingBy: 360.0)) + 360.0).truncatingRemainder(
            dividingBy: 360.0
        )
    }
}

extension Hue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self = .number(.init(value))
    }
}

extension Hue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self = .number(.init(value))
    }
}

extension Hue: CustomStringConvertible {

    public var description: String {
        switch self {
        case .number(let number):
            return number.value.formatted(.number)

        case .angle(let angle):
            return angle.description
        }
    }
}
