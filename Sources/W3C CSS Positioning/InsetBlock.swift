public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum InsetBlock: Property, LengthPercentageConvertible {

    case auto

    case sides(start: LengthPercentage, end: LengthPercentage)

    case global(Global)

    public init(
        start: LengthPercentage,
        end: LengthPercentage
    ) {
        self = .sides(start: start, end: end)
    }
}

extension InsetBlock {
    public static let property: String = "inset-block"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .sides(let start, let end):
            return "\(start) \(end)"

        case .global(let global):
            return global.description
        }
    }
}

extension InsetBlock {

    public static func same(_ value: LengthPercentage) -> InsetBlock {
        .init(start: value, end: value)
    }

    public static func lengthPercentage(_ value: LengthPercentage) -> InsetBlock {
        .init(start: value, end: value)
    }
}
