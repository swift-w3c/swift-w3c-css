public import W3C_CSS_Shared

public enum JustifyItems: Property, SelfPositionConvertible, BaselinePositionConvertible {

    case normal

    case stretch

    case baseline(BaselinePosition)

    case position(OverflowPosition?, SelfPosition)

    case left

    case right

    case legacy(LegacyPosition?)

    case anchorCenter

    case global(Global)
}

extension JustifyItems {
    public static let property: String = "justify-items"
}

public enum LegacyPosition: String, Sendable, Hashable {
    case left
    case right
    case center
}

extension JustifyItems: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .stretch:
            return "stretch"

        case .baseline(let position):
            return position.description

        case .position(let overflow, let position):
            if let overflow {
                return "\(overflow) \(position)"
            } else {
                return position.description
            }

        case .left:
            return "left"

        case .right:
            return "right"

        case .legacy(let position):
            if let position {
                return "legacy \(position)"
            } else {
                return "legacy"
            }

        case .anchorCenter:
            return "anchor-center"

        case .global(let global):
            return global.description
        }
    }
}

extension JustifyItems {

    public static func legacyCenter() -> Self {
        return .legacy(.center)
    }

    public static func legacyLeft() -> Self {
        return .legacy(.left)
    }

    public static func legacyRight() -> Self {
        return .legacy(.right)
    }
}
