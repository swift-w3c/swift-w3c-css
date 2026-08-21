public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TransitionBehavior: Property {

    case allowDiscrete

    case normal

    case global(Global)
}

extension TransitionBehavior {
    public static let property: String = "transition-behavior"

    public var description: String {
        switch self {
        case .allowDiscrete:
            return "allow-discrete"

        case .normal:
            return "normal"

        case .global(let global):
            return global.description
        }
    }
}
