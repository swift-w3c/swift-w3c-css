public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MarginBlock: Property, LengthPercentageConvertible {

    case uniform(LengthPercentage)

    case separate(start: LengthPercentage, end: LengthPercentage)

    case global(Global)

    public init(_ start: LengthPercentage, _ end: LengthPercentage) {
        self = .separate(start: start, end: end)
    }

    public init(_ value: LengthPercentage) {
        self = .uniform(value)
    }

    public init(_ start: Length, _ end: Length) {
        self = .separate(start: .length(start), end: .length(end))
    }

    public init(_ value: Length) {
        self = .uniform(.length(value))
    }
}

extension MarginBlock {
    public static let property: String = "margin-block"

    public static func lengthPercentage(_ value: LengthPercentage) -> MarginBlock {
        .uniform(value)
    }
}

extension MarginBlock: CustomStringConvertible {
    public var description: String {
        switch self {
        case .uniform(let value):
            return value.description

        case .separate(let start, let end):
            return "\(start.description) \(end.description)"

        case .global(let global):
            return global.description
        }
    }
}
