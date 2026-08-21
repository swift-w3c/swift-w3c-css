public import W3C_CSS_Shared
import W3C_CSS_Values

public enum RubyAlign: Property {

    case start

    case center

    case spaceBetween

    case spaceAround

    case global(Global)
}

extension RubyAlign {
    public static let property: String = "ruby-align"
    public var description: String {
        switch self {
        case .start:
            return "start"

        case .center:
            return "center"

        case .spaceBetween:
            return "space-between"

        case .spaceAround:
            return "space-around"

        case .global(let global):
            return global.description
        }
    }
}
