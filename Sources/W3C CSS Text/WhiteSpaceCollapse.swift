public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WhiteSpaceCollapse: Property {

    case collapse

    case preserve

    case preserveBreaks

    case preserveSpaces

    case breakSpaces

    case global(Global)
}

extension WhiteSpaceCollapse {
    public static let property: String = "white-space-collapse"
    public var description: String {
        switch self {
        case .collapse:
            return "collapse"

        case .preserve:
            return "preserve"

        case .preserveBreaks:
            return "preserve-breaks"

        case .preserveSpaces:
            return "preserve-spaces"

        case .breakSpaces:
            return "break-spaces"

        case .global(let global):
            return global.description
        }
    }
}
