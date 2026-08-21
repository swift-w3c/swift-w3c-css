public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderImageWidth: Property {

    case all(WidthValue)

    case verticalHorizontal(WidthValue, WidthValue)

    case topHorizontalBottom(WidthValue, WidthValue, WidthValue)

    case topRightBottomLeft(WidthValue, WidthValue, WidthValue, WidthValue)

    case global(Global)

    public init(_ value: WidthValue) {
        self = .all(value)
    }

    public init(_ vertical: WidthValue, _ horizontal: WidthValue) {
        self = .verticalHorizontal(vertical, horizontal)
    }

    public init(_ top: WidthValue, _ horizontal: WidthValue, _ bottom: WidthValue) {
        self = .topHorizontalBottom(top, horizontal, bottom)
    }

    public init(_ top: WidthValue, _ right: WidthValue, _ bottom: WidthValue, _ left: WidthValue) {
        self = .topRightBottomLeft(top, right, bottom, left)
    }
}

extension BorderImageWidth {
    public static let property: String = "border-image-width"
}

extension BorderImageWidth {

    public enum WidthValue: Sendable, Hashable, CustomStringConvertible, LengthPercentageConvertible
    {

        case lengthPercentage(LengthPercentage)

        case number(Number)

        case auto
    }
}

extension BorderImageWidth.WidthValue {

    public var description: String {
        switch self {
        case .lengthPercentage(let value):
            return value.description

        case .number(let number):
            return number.description

        case .auto:
            return "auto"
        }
    }
}

extension BorderImageWidth {

    public static func number(_ number: Number) -> BorderImageWidth {
        return BorderImageWidth(.number(number))
    }

    public static let auto = BorderImageWidth(.auto)

    public static let `default` = BorderImageWidth(.number(1))
}

extension BorderImageWidth: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> BorderImageWidth {
        .all(.lengthPercentage(value))
    }
}

extension BorderImageWidth: CustomStringConvertible {

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
}
