public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Resize: Property {

    case none

    case both

    case horizontal

    case vertical

    case block

    case inline

    case global(Global)
}

extension Resize {
    public static let property: String = "resize"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .both:
            return "both"

        case .horizontal:
            return "horizontal"

        case .vertical:
            return "vertical"

        case .block:
            return "block"

        case .inline:
            return "inline"

        case .global(let global):
            return global.description
        }
    }
}
