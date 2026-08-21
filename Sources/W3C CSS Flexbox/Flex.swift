public import W3C_CSS_Shared

public enum Flex: Property {

    case initial

    case auto

    case none

    case custom(grow: FlexGrow, shrink: FlexShrink, basis: FlexBasis)

    case global(Global)
}

extension Flex {
    public static let property: String = "flex"

    public var description: String {
        switch self {
        case .initial:
            return "initial"

        case .auto:
            return "auto"

        case .none:
            return "none"

        case .custom(let grow, let shrink, let basis):
            return "\(grow) \(shrink) \(basis)"

        case .global(let value):
            return value.description
        }
    }
}
