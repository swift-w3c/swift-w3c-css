public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum TextDecorationThickness: Property, LengthPercentageConvertible {

    case auto

    case fromFont

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension TextDecorationThickness {
    public static let property: String = "text-decoration-thickness"
}

extension TextDecorationThickness: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .fromFont:
            return "from-font"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}
