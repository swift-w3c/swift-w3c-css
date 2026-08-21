public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderEndEndRadius: Property {

    case radius(LengthPercentage)

    case horizontalVertical(LengthPercentage, LengthPercentage)

    case global(Global)
}

extension BorderEndEndRadius {
    public static let property: String = "border-end-end-radius"
}

extension BorderEndEndRadius: CustomStringConvertible {

    public var description: String {
        switch self {
        case .radius(let radius):
            return radius.description

        case .horizontalVertical(let horizontal, let vertical):
            return "\(horizontal) \(vertical)"

        case .global(let global):
            return global.description
        }
    }
}

extension BorderEndEndRadius: LengthPercentageConvertible {
    public static func lengthPercentage(
        _ value: LengthPercentage
    ) -> BorderEndEndRadius {
        .radius(value)
    }
}
