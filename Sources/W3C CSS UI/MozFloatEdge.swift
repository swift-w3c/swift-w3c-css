public import W3C_CSS_Shared
import W3C_CSS_Values

public enum MozFloatEdge: Property {

    case contentBox

    case marginBox

    case global(Global)
}

extension MozFloatEdge {
    public static let property: String = "-moz-float-edge"

    public var description: String {
        switch self {
        case .contentBox:
            return "content-box"

        case .marginBox:
            return "margin-box"

        case .global(let global):
            return global.description
        }
    }
}
