public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBottomRightRadius: Property {

    case radius(LengthPercentage)

    case elliptical(LengthPercentage, LengthPercentage)

    case global(Global)
}

extension BorderBottomRightRadius {
    public static let property: String = "border-bottom-right-radius"
}

extension BorderBottomRightRadius {

    public init(_ radius: LengthPercentage) {
        self = .radius(radius)
    }

    public init(_ horizontal: LengthPercentage, _ vertical: LengthPercentage) {
        self = .elliptical(horizontal, vertical)
    }

    public init(radius: LengthPercentage) {
        self = .radius(radius)
    }

    public init(horizontalRadius: LengthPercentage, verticalRadius: LengthPercentage) {
        self = .elliptical(horizontalRadius, verticalRadius)
    }
}

extension BorderBottomRightRadius: LengthPercentageConvertible {
    public static func lengthPercentage(
        _ value: LengthPercentage
    ) -> BorderBottomRightRadius {
        .radius(value)
    }
}

extension BorderBottomRightRadius: CustomStringConvertible {

    public var description: String {
        switch self {
        case .radius(let radius):
            return radius.description

        case .elliptical(let horizontal, let vertical):
            return "\(horizontal.description) \(vertical.description)"

        case .global(let global):
            return global.description
        }
    }
}
