public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum StrokeWidth: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{
    case lengthPercentage(LengthPercentage)

    case number(Number)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .number(.init(integerLiteral: value))
    }

    public init(floatLiteral value: Double) {
        self = .number(.init(floatLiteral: value))
    }
}

extension StrokeWidth {
    public static let property: String = "stroke-width"

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .number(let number):
            return number.description

        case .global(let global):
            return global.description
        }
    }
}
