public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Padding: Property, LengthPercentageConvertible {

    case all(LengthPercentage)

    case verticalHorizontal(LengthPercentage, LengthPercentage)

    case topHorizontalBottom(LengthPercentage, LengthPercentage, LengthPercentage)

    case sides(LengthPercentage, LengthPercentage, LengthPercentage, LengthPercentage)

    case named(NamedSides)

    case global(Global)
}

extension Padding {
    public static let property: String = "padding"

    public struct NamedSides: Sendable, Hashable {

        public var top: LengthPercentage?

        public var right: LengthPercentage?

        public var bottom: LengthPercentage?

        public var left: LengthPercentage?

        public init(
            top: LengthPercentage? = nil,
            right: LengthPercentage? = nil,
            bottom: LengthPercentage? = nil,
            left: LengthPercentage? = nil
        ) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }

        public init(vertical: LengthPercentage? = nil, horizontal: LengthPercentage? = nil) {
            self.top = vertical
            self.right = horizontal
            self.bottom = vertical
            self.left = horizontal
        }
    }

    public static func lengthPercentage(_ value: LengthPercentage) -> Padding {
        .all(value)
    }
}

extension Padding {

    public var description: String {
        switch self {
        case .all(let value):
            return value.description

        case .verticalHorizontal(let vertical, let horizontal):
            return "\(vertical) \(horizontal)"

        case .topHorizontalBottom(let top, let horizontal, let bottom):
            return "\(top) \(horizontal) \(bottom)"

        case .sides(let top, let right, let bottom, let left):
            return "\(top) \(right) \(bottom) \(left)"

        case .named(let sides):

            if let top = sides.top, let right = sides.right, let bottom = sides.bottom,
                let left = sides.left
            {

                if top == right && right == bottom && bottom == left {

                    return top.description
                } else if top == bottom && right == left {

                    return "\(top) \(right)"
                } else if right == left {

                    return "\(top) \(right) \(bottom)"
                } else {

                    return "\(top) \(right) \(bottom) \(left)"
                }
            } else {

                var individualProperties: [String] = []

                if let top = sides.top {
                    individualProperties.append("padding-top: \(top);")
                }
                if let right = sides.right {
                    individualProperties.append("padding-right: \(right);")
                }
                if let bottom = sides.bottom {
                    individualProperties.append("padding-bottom: \(bottom);")
                }
                if let left = sides.left {
                    individualProperties.append("padding-left: \(left);")
                }

                return individualProperties.joined(separator: " ")
            }

        case .global(let global):
            return global.description
        }
    }
}

extension Padding {

    public static func sides(vertical: LengthPercentage, horizontal: LengthPercentage) -> Padding {
        .verticalHorizontal(vertical, horizontal)
    }

    public static func sides(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil
    ) -> Padding {
        .named(NamedSides(top: top, right: right, bottom: bottom, left: left))
    }

    public static func sides(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil
    ) -> Padding {
        .named(NamedSides(vertical: vertical, horizontal: horizontal))
    }

    public static let zero: Padding = .all(.px(0))
}

extension Padding: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }
}

extension Padding: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}
