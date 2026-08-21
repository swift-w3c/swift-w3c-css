public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Margin: Property, LengthPercentageConvertible {
    case auto

    case all(LengthPercentage)

    case verticalHorizontal(LengthPercentage, LengthPercentage)

    case topHorizontalBottom(
        MarginTop,
        LengthPercentage,
        MarginBottom
    )

    case sides(
        MarginTop,
        MarginRight,
        MarginBottom,
        MarginLeft
    )

    case global(Global)
}

extension Margin {
    public static let property: String = "margin"

    public static func lengthPercentage(_ value: LengthPercentage) -> Margin {
        .all(value)
    }
}

extension Margin {

    public var description: String {
        switch self {
        case .auto: return "auto"

        case .all(let value):
            return value.description

        case .verticalHorizontal(let vertical, let horizontal):
            return "\(vertical) \(horizontal)"

        case .topHorizontalBottom(let top, let horizontal, let bottom):
            return "\(top) \(horizontal) \(bottom)"

        case .sides(let top, let right, let bottom, let left):
            return "\(top) \(right) \(bottom) \(left)"

        case .global(let global):
            return global.description
        }
    }
}

extension Margin {

    public static func sides(vertical: LengthPercentage, horizontal: LengthPercentage) -> Margin {
        .verticalHorizontal(vertical, horizontal)
    }

    public static func sides(
        top: MarginTop? = nil,
        right: MarginRight? = nil,
        bottom: MarginBottom? = nil,
        left: MarginLeft? = nil
    ) -> Margin {
        .sides(top ?? .zero, right ?? .zero, bottom ?? .zero, left ?? .zero)
    }

    public static func sides(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil
    ) -> Margin {
        .verticalHorizontal(vertical ?? .zero, horizontal ?? .zero)
    }

    public static let zero: Margin = .all(.px(0))
}

extension Margin: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }
}

extension Margin: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}
