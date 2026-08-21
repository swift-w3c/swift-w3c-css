public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ViewTransitionName: Property {

    case none

    case custom(CustomIdent)

    case global(Global)
}

extension ViewTransitionName {
    public static let property: String = "view-transition-name"
}

extension ViewTransitionName: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .custom(let ident):
            return ident.description

        case .global(let global):
            return global.description
        }
    }
}

extension ViewTransitionName {

    public static func custom(_ name: String) -> Self {
        return .custom(CustomIdent(name))
    }
}
