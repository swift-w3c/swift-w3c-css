public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum StrokeOpacity: Property {

    case number(Number)

    case percentage(Percentage)

    case global(Global)
}

extension StrokeOpacity {
    public static let property: String = "stroke-opacity"

    public var description: String {
        switch self {
        case .number(let number):

            let clampedValue = min(1.0, max(0.0, number.value))
            return String(clampedValue)

        case .percentage(let percentage):
            return percentage.description

        case .global(let global):
            return global.description
        }
    }

    public static func opacity(_ value: Double) -> Self {
        .number(.init(value))
    }

    public static func percent(_ value: Double) -> Self {
        .percentage(.init(value))
    }
}
