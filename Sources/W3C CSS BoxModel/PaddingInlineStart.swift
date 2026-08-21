public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingInlineStart: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension PaddingInlineStart {
    public static let property: String = "padding-inline-start"
}

extension PaddingInlineStart: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingInlineStart: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingInlineStart: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
