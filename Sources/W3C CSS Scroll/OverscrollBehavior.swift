public import W3C_CSS_Shared
import W3C_CSS_Values

public enum OverscrollBehavior: Property {

    case single(Value)

    case horizontalVertical(Value, Value)

    case global(Global)

}

extension OverscrollBehavior {
    public static let property: String = "overscroll-behavior"

    public enum Value: String, Sendable, Hashable {

        case auto

        case contain

        case none
    }

    public var description: String {
        switch self {
        case .single(let value):
            return value.rawValue

        case .horizontalVertical(let x, let y):
            return "\(x.rawValue) \(y.rawValue)"

        case .global(let global):
            return global.description
        }
    }
}
