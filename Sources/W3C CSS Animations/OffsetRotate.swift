public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OffsetRotate: Property, AngleConvertible {

    case auto

    case angle(Angle)

    case autoAngle(Angle)

    case reverse

    case global(Global)
}

extension OffsetRotate {
    public static let property: String = "offset-rotate"
}

extension OffsetRotate: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .angle(let angle):
            return angle.description

        case .autoAngle(let angle):
            return "auto \(angle.description)"

        case .reverse:
            return "reverse"

        case .global(let global):
            return global.description
        }
    }
}

extension OffsetRotate {

    public static func autoDeg(_ value: Double) -> Self {
        .autoAngle(.deg(value))
    }
}

extension OffsetRotate: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .angle(.deg(Double(value)))
    }

    public init(floatLiteral value: Double) {
        self = .angle(.deg(value))
    }
}
