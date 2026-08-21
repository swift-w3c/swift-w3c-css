public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FloodOpacity: Property, PercentageConvertible {

    case number(Number)

    case percentage(Percentage)

    case global(Global)

    public init(_ percentage: Percentage) {
        self = .percentage(percentage)
    }

    public init(_ opacity: Double) {
        if opacity >= 0 && opacity <= 1 {
            self = .number(.init(opacity))
        } else {

            self = .percentage(.init(opacity))
        }
    }
}

extension FloodOpacity {
    public static let property: String = "flood-opacity"

    public var description: String {
        switch self {
        case .number(let number):
            return max(0, min(1, number.value)).formatted(.number)

        case .percentage(let percentage):
            return percentage.description

        case .global(let value):
            return value.description
        }
    }
}
