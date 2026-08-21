public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollPadding: Property, LengthPercentageConvertible, CustomStringConvertible {

    case auto

    case all(LengthPercentage)

    case verticalHorizontal(LengthPercentage, LengthPercentage)

    case topHorizontalBottom(LengthPercentage, LengthPercentage, LengthPercentage)

    case topRightBottomLeft(
        LengthPercentage,
        LengthPercentage,
        LengthPercentage,
        LengthPercentage
    )

    case global(Global)

}

extension ScrollPadding {
    public static let property: String = "scroll-padding"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .all(let value):
            return value.description

        case .verticalHorizontal(let vertical, let horizontal):
            return "\(vertical.description) \(horizontal.description)"

        case .topHorizontalBottom(let top, let horizontal, let bottom):
            return "\(top.description) \(horizontal.description) \(bottom.description)"

        case .topRightBottomLeft(let top, let right, let bottom, let left):
            return
                "\(top.description) \(right.description) \(bottom.description) \(left.description)"

        case .global(let global):
            return global.description
        }
    }

    public static func lengthPercentage(_ value: LengthPercentage) -> ScrollPadding {
        .all(value)
    }

    public static func percent(vertical: Percentage, horizontal: Percentage) -> Self {
        .verticalHorizontal(.percentage(vertical), .percentage(horizontal))
    }

    public static func percent(top: Percentage, horizontal: Percentage, bottom: Percentage) -> Self
    {
        .topHorizontalBottom(.percentage(top), .percentage(horizontal), .percentage(bottom))
    }

    public static func percent(
        top: Percentage,
        right: Percentage,
        bottom: Percentage,
        left: Percentage
    ) -> Self {
        .topRightBottomLeft(
            .percentage(top),
            .percentage(right),
            .percentage(bottom),
            .percentage(left)
        )
    }
}
