public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FillOpacity: Property {

    case number(Number)

    case percentage(Percentage)

    case global(Global)
}

extension FillOpacity {
    public static let property: String = "fill-opacity"

    public var description: String {
        switch self {
        case .number(let number):

            let clampedValue = max(0, min(1, number.value))

            guard clampedValue == Double(Int(clampedValue)) else {

                let rounded = (clampedValue * 100).rounded() / 100
                return String(rounded)
            }
            return "\(Int(clampedValue))"

        case .percentage(let percentage):
            return percentage.description

        case .global(let value):
            return value.description
        }
    }
}
