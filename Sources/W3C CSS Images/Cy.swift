public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Cy: Property {

    case length(Length)

    case percentage(Percentage)

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension Cy {
    public static let property: String = "cy"

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
