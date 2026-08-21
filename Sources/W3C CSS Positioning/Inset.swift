public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Inset: Property, LengthPercentageConvertible {

    case auto

    case sides(top: Value, right: Value, bottom: Value, left: Value)

    case global(Global)

    public init(_ value: LengthPercentage) {
        self = .sides(
            top: .lengthPercentage(value),
            right: .lengthPercentage(value),
            bottom: .lengthPercentage(value),
            left: .lengthPercentage(value)
        )
    }

    public init(auto: Bool = true) {
        if auto {
            self = .auto
        } else {
            self = .sides(
                top: .length(.px(0)),
                right: .length(.px(0)),
                bottom: .length(.px(0)),
                left: .length(.px(0))
            )
        }
    }

    public init(vertical: LengthPercentage, horizontal: LengthPercentage) {
        self = .sides(
            top: .lengthPercentage(vertical),
            right: .lengthPercentage(horizontal),
            bottom: .lengthPercentage(vertical),
            left: .lengthPercentage(horizontal)
        )
    }

    public init(top: LengthPercentage, horizontal: LengthPercentage, bottom: LengthPercentage) {
        self = .sides(
            top: .lengthPercentage(top),
            right: .lengthPercentage(horizontal),
            bottom: .lengthPercentage(bottom),
            left: .lengthPercentage(horizontal)
        )
    }

    public init(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage
    ) {
        self = .sides(
            top: .lengthPercentage(top),
            right: .lengthPercentage(right),
            bottom: .lengthPercentage(bottom),
            left: .lengthPercentage(left)
        )
    }

    public init(
        top: Value,
        right: Value,
        bottom: Value,
        left: Value
    ) {
        self = .sides(top: top, right: right, bottom: bottom, left: left)
    }
}

extension Inset {
    public static let property: String = "inset"

    public enum Value: Hashable, Sendable, LengthPercentageConvertible {

        case auto

        case lengthPercentage(LengthPercentage)
    }

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .sides(let top, let right, let bottom, let left):

            if top == right && right == bottom && bottom == left {

                return top.description
            } else if top == bottom && right == left {

                return "\(top.description) \(right.description)"
            } else if right == left {

                return "\(top.description) \(right.description) \(bottom.description)"
            } else {

                return
                    "\(top.description) \(right.description) \(bottom.description) \(left.description)"
            }

        case .global(let global):
            return global.description
        }
    }

    public static func lengthPercentage(_ value: LengthPercentage) -> Inset {
        .init(value)
    }
}

extension Inset.Value {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let value):
            return value.description
        }
    }

    public static func from(_ value: LengthPercentage) -> Inset.Value {
        .lengthPercentage(value)
    }
}

extension Inset: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(.px(Double(value)))
    }
}

extension Inset: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self.init(.px(value))
    }
}
