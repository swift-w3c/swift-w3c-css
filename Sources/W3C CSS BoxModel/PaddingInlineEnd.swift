public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingInlineEnd: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension PaddingInlineEnd {
    public static let property: String = "padding-inline-end"
}

extension PaddingInlineEnd: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingInlineEnd: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingInlineEnd: ExpressibleByFloatLiteral {

    public init(floatLiteral lengthPercentage: Double) {
        self = .lengthPercentage(.px(lengthPercentage))
    }
}
