public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Right: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case auto

    case global(Global)
}

extension Right {
    public static let property: String = "right"

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}
