public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollPaddingTop: Property, LengthPercentageConvertible, CustomStringConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case global(Global)

}

extension ScrollPaddingTop {
    public static let property: String = "scroll-padding-top"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .lengthPercentage(let lengthPercentage): return lengthPercentage.description
        case .global(let global): return global.description
        }
    }

    public static func px(_ value: Double) -> Self {
        .length(.px(value))
    }

    public static func percent(_ value: Double) -> Self {
        .percentage(.init(value))
    }
}
