public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Float: Property {

    case none

    case left

    case right

    case inlineStart

    case inlineEnd

    case global(Global)
}

extension Float {
    public static let property: String = "float"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .left:
            return "left"

        case .right:
            return "right"

        case .inlineStart:
            return "inline-start"

        case .inlineEnd:
            return "inline-end"

        case .global(let value):
            return value.description
        }
    }
}
