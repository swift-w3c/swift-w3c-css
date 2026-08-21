public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingInline: Property {

    case uniform(LengthPercentage)

    case separate(LengthPercentage, LengthPercentage)

    case global(Global)
}

extension PaddingInline: CustomStringConvertible {

    public var description: String {
        switch self {
        case .uniform(let value):
            return value.description

        case .separate(let start, let end):
            return "\(start) \(end)"

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingInline {
    public static let property: String = "padding-inline"

    public static func separate(start: LengthPercentage, end: LengthPercentage) -> PaddingInline {
        .separate(start, end)
    }

    public static func px(_ start: Double, _ end: Double? = nil) -> PaddingInline {
        if let end {
            return .separate(.px(start), .px(end))
        }
        return .uniform(.px(start))
    }

    public static func em(_ start: Double, _ end: Double? = nil) -> PaddingInline {
        if let end {
            return .separate(.em(start), .em(end))
        }
        return .uniform(.em(start))
    }

    public static func percentage(_ start: Percentage, _ end: Percentage? = nil) -> PaddingInline {
        if let end {
            return .separate(.percentage(start), .percentage(end))
        }
        return .uniform(.percentage(start))
    }

    public static let zero: PaddingInline = .uniform(.px(0))
}

extension PaddingInline: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .uniform(.px(Double(value)))
    }
}

extension PaddingInline: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .uniform(.px(value))
    }
}
