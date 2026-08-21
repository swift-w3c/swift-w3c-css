public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum RowGap: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case normal

    case global(Global)
}

extension RowGap {
    public static let property: String = "row-gap"

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .normal:
            return "normal"

        case .global(let global):
            return global.description
        }
    }
}
