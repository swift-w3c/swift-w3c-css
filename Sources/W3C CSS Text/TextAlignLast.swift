public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextAlignLast: Property {

    case auto

    case start

    case end

    case left

    case right

    case center

    case justify

    case matchParent

    case global(Global)
}

extension TextAlignLast {
    public static let property: String = "text-align-last"
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .start:
            return "start"

        case .end:
            return "end"

        case .left:
            return "left"

        case .right:
            return "right"

        case .center:
            return "center"

        case .justify:
            return "justify"

        case .matchParent:
            return "match-parent"

        case .global(let global):
            return global.description
        }
    }
}
