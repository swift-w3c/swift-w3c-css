public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderEndStartRadius: Property {

    case radius(LengthPercentage)

    case horizontalVertical(LengthPercentage, LengthPercentage)

    case global(Global)
}

extension BorderEndStartRadius {
    public static let property: String = "border-end-start-radius"
}

extension BorderEndStartRadius: CustomStringConvertible {

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

extension BorderEndStartRadius: LengthPercentageConvertible {
    public static func lengthPercentage(
        _ value: LengthPercentage
    ) -> BorderEndStartRadius {
        .radius(value)
    }
}
