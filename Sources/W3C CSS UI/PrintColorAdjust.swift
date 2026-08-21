public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PrintColorAdjust: Property {

    case economy

    case exact

    case global(Global)
}

extension PrintColorAdjust {
    public static let property: String = "print-color-adjust"

    public var description: String {
        switch self {
        case .economy:
            return "economy"

        case .exact:
            return "exact"

        case .global(let global):
            return global.description
        }
    }
}
