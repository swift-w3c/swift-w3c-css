public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PositionAnchor: Property {

    case auto

    case anchorName(DashedIdent)

    case global(Global)
}

extension PositionAnchor {
    public static let property: String = "position-anchor"

    public static func anchorName(_ name: String) -> PositionAnchor {
        .anchorName(DashedIdent(name))
    }

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .anchorName(let name):
            return name.description

        case .global(let global):
            return global.description
        }
    }
}
