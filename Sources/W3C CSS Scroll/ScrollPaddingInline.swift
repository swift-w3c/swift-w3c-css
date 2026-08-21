public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollPaddingInline: Property, LengthPercentageConvertible, CustomStringConvertible {

    case auto

    case lengthPercentage(LengthPercentage)

    case startEnd(start: LengthPercentage, end: LengthPercentage)

    case global(Global)

}

extension ScrollPaddingInline {
    public static let property: String = "scroll-padding-inline"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let value):
            return value.description

        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"

        case .global(let global):
            return global.description
        }
    }

    public static func all(_ value: LengthPercentage) -> ScrollPaddingInline {
        .lengthPercentage(value)
    }
}
