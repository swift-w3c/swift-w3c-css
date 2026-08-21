public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBottomLeftRadius: Property {

    case radius(LengthPercentage)

    case elliptical(LengthPercentage, LengthPercentage)

    case global(Global)
}

extension BorderBottomLeftRadius {
    public static let property: String = "border-bottom-left-radius"
}

extension BorderBottomLeftRadius {

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

extension BorderBottomLeftRadius: LengthPercentageConvertible {
    public static func lengthPercentage(
        _ value: LengthPercentage
    ) -> BorderBottomLeftRadius {
        .radius(value)
    }
}

extension BorderBottomLeftRadius: CustomStringConvertible {

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
