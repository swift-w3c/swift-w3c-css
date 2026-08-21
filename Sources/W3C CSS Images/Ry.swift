public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Ry: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case auto

    case global(Global)
}

extension Ry {
    public static let property: String = "ry"

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
