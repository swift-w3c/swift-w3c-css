public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollSnapType: Property {

    case none

    case axis(Axis)

    case axisWithStrictness(Axis, Strictness)

    case global(Global)

}

extension ScrollSnapType {
    public static let property: String = "scroll-snap-type"

    public enum Axis: String, Sendable {

        case x

        case y

        case block

        case inline

        case both
    }

    public enum Strictness: String, Sendable {

        case mandatory

        case proximity
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .axis(let axis):
            return axis.rawValue

        case .axisWithStrictness(let axis, let strictness):
            return "\(axis.rawValue) \(strictness.rawValue)"

        case .global(let global):
            return global.description
        }
    }

    public static func axis(_ axis: Axis, strictness: Strictness) -> Self {
        .axisWithStrictness(axis, strictness)
    }

    public static let xMandatory: Self = .axisWithStrictness(.x, .mandatory)

    public static let yMandatory: Self = .axisWithStrictness(.y, .mandatory)

    public static let xProximity: Self = .axisWithStrictness(.x, .proximity)

    public static let yProximity: Self = .axisWithStrictness(.y, .proximity)

    public static let bothMandatory: Self = .axisWithStrictness(.both, .mandatory)

    public static let bothProximity: Self = .axisWithStrictness(.both, .proximity)
}
