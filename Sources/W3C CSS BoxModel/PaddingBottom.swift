public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingBottom: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension PaddingBottom {
    public static let property: String = "padding-bottom"
}

extension PaddingBottom: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingBottom: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
