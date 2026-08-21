public import W3C_CSS_Shared

public enum FontSizeAdjust: Property {

    case none

    case value(Double)

    case fromFont

    case metric(Metric, ValueOrFromFont)

    case global(Global)
}

extension FontSizeAdjust {
    public static let property: String = "font-size-adjust"

    public enum Metric: String, Sendable, CustomStringConvertible {

        case exHeight = "ex-height"

        case capHeight = "cap-height"

        case chWidth = "ch-width"

        case icWidth = "ic-width"

        case icHeight = "ic-height"
    }

    public enum ValueOrFromFont: Sendable, Hashable, CustomStringConvertible {

        case value(Double)

        case fromFont
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .value(let number):
            return String(number)

        case .fromFont:
            return "from-font"

        case .metric(let metric, let value):
            return "\(metric.description) \(value.description)"

        case .global(let value):
            return value.description
        }
    }
}

extension FontSizeAdjust.Metric {
    public var description: String {
        return rawValue
    }
}

extension FontSizeAdjust.ValueOrFromFont {
    public var description: String {
        switch self {
        case .value(let number):
            return String(number)

        case .fromFont:
            return "from-font"
        }
    }
}
