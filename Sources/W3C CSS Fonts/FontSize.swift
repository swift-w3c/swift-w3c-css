public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FontSize: Property, LengthPercentageConvertible {

    case absoluteSize(AbsoluteSize)

    case relativeSize(RelativeSize)

    case lengthPercentage(LengthPercentage)

    case math

    case global(Global)
}

extension FontSize {
    public static let property: String = "font-size"

    public static let xxSmall: FontSize = .absoluteSize(.xxSmall)
    public static let xSmall: FontSize = .absoluteSize(.xSmall)
    public static let small: FontSize = .absoluteSize(.small)
    public static let medium: FontSize = .absoluteSize(.medium)
    public static let large: FontSize = .absoluteSize(.large)
    public static let xLarge: FontSize = .absoluteSize(.xLarge)
    public static let xxLarge: FontSize = .absoluteSize(.xxLarge)
    public static let xxxLarge: FontSize = .absoluteSize(.xxxLarge)

    public static let smaller: FontSize = .relativeSize(.smaller)
    public static let larger: FontSize = .relativeSize(.larger)

    public var description: String {
        switch self {
        case .absoluteSize(let size):
            return size.description

        case .relativeSize(let size):
            return size.description

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .math:
            return "math"

        case .global(let value):
            return value.description
        }
    }
}
