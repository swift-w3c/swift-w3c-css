public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollbarWidth: Property {

    case auto

    case thin

    case none

    case global(Global)
}

extension ScrollbarWidth {
    public static let property: String = "scrollbar-width"
}

extension ScrollbarWidth: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .thin:
            return "thin"

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}
