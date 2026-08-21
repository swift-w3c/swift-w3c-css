public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ContainerType: Property, GlobalConvertible {

    case normal

    case inlineSize

    case size

    case scrollState

    case sizeScrollState

    case inlineSizeScrollState

    case global(Global)
}

extension ContainerType {
    public static let property: String = "container-type"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .inlineSize:
            return "inline-size"

        case .size:
            return "size"

        case .scrollState:
            return "scroll-state"

        case .sizeScrollState:
            return "size scroll-state"

        case .inlineSizeScrollState:
            return "inline-size scroll-state"

        case .global(let value):
            return value.description
        }
    }
}
