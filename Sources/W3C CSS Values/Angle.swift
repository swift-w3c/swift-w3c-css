import Format_Primitives

public enum Angle: Sendable, Hashable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    case deg(Double)

    case rad(Double)

    case grad(Double)

    case turn(Double)

    public init(integerLiteral value: Int) {
        self = .deg(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .deg(value)
    }
}

extension Angle {
    public static func degrees(_ value: Double) -> Self {
        .deg(value)
    }

    public static func gradians(_ value: Double) -> Self {
        .grad(value)
    }

    public static func radians(_ value: Double) -> Self {
        .rad(value)
    }
}

extension Angle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .deg(let value):
            return "\(value.formatted(.number))deg"

        case .rad(let value):
            return "\(value.formatted(.number))rad"

        case .grad(let value):
            return "\(value.formatted(.number))grad"

        case .turn(let value):
            return "\(value.formatted(.number))turn"
        }
    }
}
