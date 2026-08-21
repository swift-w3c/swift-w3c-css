public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum GridAutoColumns: Property {

    case auto

    case px(Double)

    case percentage(Percentage)

    case fr(Double)

    case minContent

    case maxContent

    case minMax(MinMaxValue, MinMaxValue)

    case fitContent(LengthPercentage)

    case multiple([GridAutoColumns])

    case global(Global)
}

extension GridAutoColumns {
    public static let property: String = "grid-auto-columns"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .px(let value):
            return "\(value.formatted(.number))px"

        case .percentage(let percentage):
            return percentage.description

        case .fr(let value):
            return "\(value.formatted(.number))fr"

        case .minContent:
            return "min-content"

        case .maxContent:
            return "max-content"

        case .minMax(let min, let max):
            return "minmax(\(min), \(max))"

        case .fitContent(let value):
            return "fit-content(\(value))"

        case .multiple(let tracks):
            return tracks.map { $0.description }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}

public enum MinMaxValue: Sendable, Hashable, CustomStringConvertible {

    case auto

    case px(Double)

    case percentage(Percentage)

    case fr(Double)

    case minContent

    case maxContent
}

extension MinMaxValue {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .px(let value):
            return "\(value.formatted(.number))px"

        case .percentage(let percentage):
            return percentage.description

        case .fr(let value):
            return "\(value.formatted(.number))fr"

        case .minContent:
            return "min-content"

        case .maxContent:
            return "max-content"
        }
    }
}
