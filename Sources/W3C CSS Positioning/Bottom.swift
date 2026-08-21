public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Bottom: Property, LengthPercentageConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case global(Global)

}

extension Bottom {
    public static let property: String = "bottom"
}

extension Bottom: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let value):
            return value.description

        case .global(let global):
            return global.description
        }
    }
}
