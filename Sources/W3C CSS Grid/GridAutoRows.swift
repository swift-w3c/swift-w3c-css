public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum GridAutoRows: Property, LengthPercentageConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case minContent

    case maxContent

    case minMax(MinMaxValue, MinMaxValue)

    case fitContent(LengthPercentage)

    case multiple([GridAutoRows])

    case global(Global)
}

extension GridAutoRows {
    public static let property: String = "grid-auto-rows"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

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
