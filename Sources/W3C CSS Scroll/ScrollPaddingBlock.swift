public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollPaddingBlock: Property, LengthPercentageConvertible, CustomStringConvertible {

    case auto

    case all(LengthPercentage)

    case startEnd(LengthPercentage, LengthPercentage)

    case global(Global)

}

extension ScrollPaddingBlock {
    public static let property: String = "scroll-padding-block"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .all(let value):
            return value.description

        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"

        case .global(let global):
            return global.description
        }
    }

    public static func px(_ value: Double) -> Self {
        .all(.length(.px(value)))
    }
    public static func lengthPercentage(_ value: LengthPercentage) -> ScrollPaddingBlock {
        .all(value)
    }
}
