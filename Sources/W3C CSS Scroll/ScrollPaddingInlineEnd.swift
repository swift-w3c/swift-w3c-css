public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollPaddingInlineEnd: Property, LengthPercentageConvertible, CustomStringConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case global(Global)

}

extension ScrollPaddingInlineEnd {
    public static let property: String = "scroll-padding-inline-end"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .lengthPercentage(let lengthPercentage): return lengthPercentage.description
        case .global(let global): return global.description
        }
    }
}
