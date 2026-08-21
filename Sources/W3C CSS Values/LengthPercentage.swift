public enum LengthPercentage: Sendable, Hashable, LengthConvertible, PercentageConvertible {

    case length(Length)

    case percentage(Percentage)

    case calc(String)
}

extension LengthPercentage {

    public static func px(_ value: Double) -> LengthPercentage {
        return .length(.px(value))
    }

    public static func em(_ value: Double) -> LengthPercentage {
        return .length(.em(value))
    }

    public static func rem(_ value: Double) -> LengthPercentage {
        return .length(.rem(value))
    }

    public static let auto: LengthPercentage = .length(.auto)

    public static func px(_ value: Int) -> LengthPercentage {
        return .length(.px(Double(value)))
    }

    public static func em(_ value: Int) -> LengthPercentage {
        return .length(.em(Double(value)))
    }

    public static func rem(_ value: Int) -> LengthPercentage {
        return .length(.rem(Double(value)))
    }

    public static func percentage(_ value: Int) -> LengthPercentage {
        return .percentage(Percentage(value))
    }
}

extension LengthPercentage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .percentage(let percentage):
            return percentage.description

        case .calc(let expression):
            return "calc(\(expression))"
        }
    }
}

extension LengthPercentage: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: IntegerLiteralType) {
        self = .length(.px(Double(value)))
    }
}

extension LengthPercentage: ExpressibleByFloatLiteral {

    public init(floatLiteral value: FloatLiteralType) {
        self = .length(.px(value))
    }
}

extension LengthPercentage {
    public static let zero: Self = .length(.zero)
}
