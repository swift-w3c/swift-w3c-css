public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PositionTryOrder: Property {

    case normal

    case mostHeight

    case mostWidth

    case mostBlockSize

    case mostInlineSize

    case global(Global)
}

extension PositionTryOrder {
    public static let property: String = "position-try-order"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .mostHeight:
            return "most-height"

        case .mostWidth:
            return "most-width"

        case .mostBlockSize:
            return "most-block-size"

        case .mostInlineSize:
            return "most-inline-size"

        case .global(let global):
            return global.description
        }
    }
}
