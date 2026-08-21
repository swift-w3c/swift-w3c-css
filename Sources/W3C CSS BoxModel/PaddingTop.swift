public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingTop: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension PaddingTop {
    public static let property: String = "padding-top"
}

extension PaddingTop: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingTop: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingTop: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
