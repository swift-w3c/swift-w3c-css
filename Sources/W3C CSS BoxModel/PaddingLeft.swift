public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum PaddingLeft: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension PaddingLeft {
    public static let property: String = "padding-left"
}

extension PaddingLeft: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingLeft: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingLeft: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
