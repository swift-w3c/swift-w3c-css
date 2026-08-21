public enum FrequencyPercentage: Sendable, Hashable, PercentageConvertible {

    case frequency(Frequency)

    case percentage(Percentage)
}

extension FrequencyPercentage {

    public static func hz(_ number: Number) -> FrequencyPercentage {
        return .frequency(.hz(number))
    }

    public static func khz(_ number: Number) -> FrequencyPercentage {
        return .frequency(.khz(number))
    }
}

extension FrequencyPercentage: CustomStringConvertible {

    public var description: String {
        switch self {
        case .frequency(let frequency):
            return frequency.description

        case .percentage(let percentage):
            return percentage.description
        }
    }
}
