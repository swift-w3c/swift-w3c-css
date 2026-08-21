public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MozUserInput: Property {

    case auto

    case none

    case global(Global)
}

extension MozUserInput {
    public static let property: String = "-moz-user-input"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}
