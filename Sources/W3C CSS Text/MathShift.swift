public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MathShift: Property {

    case normal

    case compact

    case global(Global)
}

extension MathShift {
    public static let property: String = "math-shift"
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .compact:
            return "compact"

        case .global(let global):
            return global.description
        }
    }
}
