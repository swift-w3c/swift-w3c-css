public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum X: Property, LengthPercentageConvertible {
    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension X {
    public static let property: String = "x"

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}
