public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Rotate: Property {

    case none

    case z(Angle)

    case axis(Axis, Angle)

    case vector(Double, Double, Double, Angle)

    case global(Global)
}

extension Rotate {
    public static let property: String = "rotate"
}

extension Rotate {

    public enum Axis: String, Sendable, Hashable {

        case x

        case y

        case z
    }
}

extension Rotate {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .z(let angle):
            return angle.description

        case .axis(let axis, let angle):
            return "\(axis.rawValue) \(angle.description)"

        case .vector(let x, let y, let z, let angle):
            return
                "\(x.formatted(.number)) \(y.formatted(.number)) \(z.formatted(.number)) \(angle.description)"

        case .global(let global):
            return global.description
        }
    }
}
