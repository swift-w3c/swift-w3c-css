public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WebkitTextSecurity: Property {

    case none

    case disc

    case circle

    case square

    case global(Global)
}

extension WebkitTextSecurity {
    public static let property: String = "-webkit-text-security"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .disc:
            return "disc"

        case .circle:
            return "circle"

        case .square:
            return "square"

        case .global(let global):
            return global.description
        }
    }
}
