public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ViewTimelineName: Property {

    case none

    case custom(DashedIdent)

    case global(Global)
}

extension ViewTimelineName {
    public static let property: String = "view-timeline-name"
}

extension ViewTimelineName: CustomStringConvertible {

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

extension ViewTimelineName {

    public static func custom(_ name: String) -> Self {
        return .custom(DashedIdent(name))
    }
}
