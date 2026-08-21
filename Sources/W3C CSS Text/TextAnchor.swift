public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextAnchor: Property {

    case start

    case middle

    case end

    case global(Global)
}

extension TextAnchor {
    public static let property: String = "text-anchor"
}

extension TextAnchor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .start:
            return "start"

        case .middle:
            return "middle"

        case .end:
            return "end"

        case .global(let global):
            return global.description
        }
    }
}
