public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OffsetDistance: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension OffsetDistance {
    public static let property: String = "offset-distance"
}

extension OffsetDistance: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension OffsetDistance {

    public static func percentage(_ value: Double) -> Self {
        .lengthPercentage(.percentage(Percentage(value)))
    }

    public static func px(_ value: Double) -> Self {
        .lengthPercentage(.px(value))
    }

    public static func em(_ value: Double) -> Self {
        .lengthPercentage(.em(value))
    }

    public static func rem(_ value: Double) -> Self {
        .lengthPercentage(.rem(value))
    }
}

extension OffsetDistance: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
