public import W3C_CSS_Shared

public enum AlignItems: Property, SelfPositionConvertible, BaselinePositionConvertible {

    case normal

    case stretch

    case baseline(BaselinePosition)

    case position(OverflowPosition?, SelfPosition)

    case anchorCenter

    case global(Global)
}

extension AlignItems {
    public static let property: String = "align-items"
}

extension AlignItems {

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

        case .anchorCenter:
            return "anchor-center"

        case .global(let global):
            return global.description
        }
    }
}

extension AlignItems {

    public static let baseline = Self.baseline(.baseline)

    public static let firstBaseline = Self.baseline(.firstBaseline)

    public static let lastBaseline = Self.baseline(.lastBaseline)

}
