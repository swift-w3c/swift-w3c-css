public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Cx: Property {

    case length(Length)

    case percentage(Percentage)

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension Cx {
    public static let property: String = "cx"

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .percentage(let percentage):
            return percentage.description

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let value):
            return value.description
        }
    }
}
