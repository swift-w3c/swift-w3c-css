public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderTopLeftRadius: Property {

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

extension BorderTopLeftRadius {
    public static let property: String = "border-top-left-radius"
}

extension BorderTopLeftRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> BorderTopLeftRadius {
        .radius(value)
    }
}

extension BorderTopLeftRadius: CustomStringConvertible {

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
