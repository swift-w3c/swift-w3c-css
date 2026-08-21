public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderTopRightRadius: Property {

    case radius(LengthPercentage)

    case elliptical(LengthPercentage, LengthPercentage)

    case global(Global)

    public init(_ horizontal: LengthPercentage, _ vertical: LengthPercentage? = nil) {
        if let vertical {
            self = .elliptical(horizontal, vertical)
        } else {
            self = .radius(horizontal)
        }
    }

    public init(radius: LengthPercentage) {
        self = .radius(radius)
    }

    public init(horizontalRadius: LengthPercentage, verticalRadius: LengthPercentage) {
        self = .elliptical(horizontalRadius, verticalRadius)
    }
}

extension BorderTopRightRadius {
    public static let property: String = "border-top-right-radius"
}

extension BorderTopRightRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> BorderTopRightRadius {
        .radius(value)
    }
}

extension BorderTopRightRadius: PercentageConvertible {

    public static func percentage(_ percentage: Percentage) -> BorderTopRightRadius {
        .radius(.percentage(percentage))
    }
}

extension BorderTopRightRadius: CustomStringConvertible {

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
