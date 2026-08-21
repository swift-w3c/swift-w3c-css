public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingBlock: Property {

    case uniform(LengthPercentage)

    case separate(LengthPercentage, LengthPercentage)

    case global(Global)
}

extension PaddingBlock: CustomStringConvertible {

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

extension PaddingBlock {
    public static let property: String = "padding-block"

    public static func separate(start: LengthPercentage, end: LengthPercentage) -> PaddingBlock {
        .separate(start, end)
    }

    public static func px(_ start: Double, _ end: Double? = nil) -> PaddingBlock {
        if let end {
            return .separate(.px(start), .px(end))
        }
        return .uniform(.px(start))
    }

    public static func em(_ start: Double, _ end: Double? = nil) -> PaddingBlock {
        if let end {
            return .separate(.em(start), .em(end))
        }
        return .uniform(.em(start))
    }

    public static func percentage(_ start: Percentage, _ end: Percentage? = nil) -> PaddingBlock {
        if let end {
            return .separate(.percentage(start), .percentage(end))
        }
        return .uniform(.percentage(start))
    }

    public static let zero: PaddingBlock = .uniform(.px(0))
}

extension PaddingBlock: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .uniform(.px(Double(value)))
    }
}

extension PaddingBlock: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .uniform(.px(value))
    }
}
