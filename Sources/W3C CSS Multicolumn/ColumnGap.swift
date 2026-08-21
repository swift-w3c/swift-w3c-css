public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ColumnGap: Property, LengthPercentageConvertible {

    case normal

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension ColumnGap {
    public static let property: String = "column-gap"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension ColumnGap: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
