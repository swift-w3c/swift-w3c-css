public import W3C_CSS_Shared

public enum AlignSelf: Property, SelfPositionConvertible, BaselinePositionConvertible {

    case auto

    case normal

    case stretch

    case baseline(BaselinePosition)

    case position(OverflowPosition?, SelfPosition)

    case anchorCenter

    case global(Global)
}

extension AlignSelf {
    public static let property: String = "align-self"
}

extension AlignSelf {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

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

        case .anchorCenter:
            return "anchor-center"

        case .global(let global):
            return global.description
        }
    }
}
