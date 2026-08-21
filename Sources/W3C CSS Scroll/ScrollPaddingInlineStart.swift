public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollPaddingInlineStart: Property, LengthPercentageConvertible, CustomStringConvertible
{

    case auto

    case lengthPercentage(LengthPercentage)

    case global(Global)

}

extension ScrollPaddingInlineStart {
    public static let property: String = "scroll-padding-inline-start"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .lengthPercentage(let lengthPercentage): return lengthPercentage.description
        case .global(let global): return global.description
        }
    }
}
