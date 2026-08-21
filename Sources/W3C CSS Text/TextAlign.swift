public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextAlign: Property {

    case start

    case end

    case left

    case right

    case center

    case justify

    case justifyAll

    case matchParent

    case global(Global)
}

extension TextAlign {
    public static let property: String = "text-align"
    public var description: String {
        switch self {
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

        case .justifyAll:
            return "justify-all"

        case .matchParent:
            return "match-parent"

        case .global(let global):
            return global.description
        }
    }
}
