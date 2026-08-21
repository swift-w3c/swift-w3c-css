public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaskBorderWidth: Property {

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

extension MaskBorderWidth {
    public static let property: String = "mask-border-width"

    public enum WidthValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {

        case length(Length)

        case percentage(Percentage)

        case number(Number)

        case auto
    }

    public static func px(_ px: Double) -> MaskBorderWidth {
        return MaskBorderWidth(.length(.px(px)))
    }

    public static func percentage(_ percentage: Percentage) -> MaskBorderWidth {
        return MaskBorderWidth(.percentage(percentage))
    }

    public static func number(_ number: Number) -> MaskBorderWidth {
        return MaskBorderWidth(.number(number))
    }

    public static let auto = MaskBorderWidth(.auto)

    public static let `default` = MaskBorderWidth(.auto)
}

extension MaskBorderWidth.WidthValue {

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .percentage(let percentage):
            return percentage.description

        case .number(let number):
            return number.description

        case .auto:
            return "auto"
        }
    }
}

extension MaskBorderWidth: CustomStringConvertible {

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
