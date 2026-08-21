public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MozOrient: Property {

    case inline

    case block

    case horizontal

    case vertical

    case global(Global)
}

extension MozOrient {
    public static let property: String = "-moz-orient"

    public var description: String {
        switch self {
        case .inline:
            return "inline"

        case .block:
            return "block"

        case .horizontal:
            return "horizontal"

        case .vertical:
            return "vertical"

        case .global(let global):
            return global.description
        }
    }
}
