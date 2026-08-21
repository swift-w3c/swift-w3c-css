public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollMargin: Property, LengthConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{

    case all(Length)

    case verticalHorizontal(Length, Length)

    case topHorizontalBottom(Length, Length, Length)

    case topRightBottomLeft(Length, Length, Length, Length)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }

    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}

extension ScrollMargin {
    public static let property: String = "scroll-margin"

    public var description: String {
        switch self {
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

    public static func length(_ length: Length) -> Self {
        .all(length)
    }
}
