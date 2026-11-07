public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderImageOutset: Property {

    case all(OutsetValue)

    case verticalHorizontal(OutsetValue, OutsetValue)

    case topHorizontalBottom(OutsetValue, OutsetValue, OutsetValue)

    case topRightBottomLeft(OutsetValue, OutsetValue, OutsetValue, OutsetValue)

    case global(Global)

    public init(_ value: OutsetValue) {
        self = .all(value)
    }

    public init(_ vertical: OutsetValue, _ horizontal: OutsetValue) {
        self = .verticalHorizontal(vertical, horizontal)
    }

    public init(_ top: OutsetValue, _ horizontal: OutsetValue, _ bottom: OutsetValue) {
        self = .topHorizontalBottom(top, horizontal, bottom)
    }

    public init(
        _ top: OutsetValue,
        _ right: OutsetValue,
        _ bottom: OutsetValue,
        _ left: OutsetValue
    ) {
        self = .topRightBottomLeft(top, right, bottom, left)
    }
}

extension BorderImageOutset {
    public static let property: String = "border-image-outset"
}

extension BorderImageOutset {

    public enum OutsetValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {

        case length(Length)

        case number(Number)
    }
}

extension BorderImageOutset.OutsetValue {

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .number(let number):
            return number.description
        }
    }
}

extension BorderImageOutset {

    public static func number(_ number: Number) -> BorderImageOutset {
        return BorderImageOutset(.number(number))
    }
}

extension BorderImageOutset: LengthConvertible {
    public static func length(_ length: Length) -> BorderImageOutset {
        .all(.length(length))
    }
}

extension BorderImageOutset: CustomStringConvertible {

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
