public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum StrokeDashoffset: Property {

    case number(Number)

    case length(Length)

    case percentage(Percentage)

    case lengthPercentage(LengthPercentage)

    case global(Global)
}

extension StrokeDashoffset {
    public static let property: String = "stroke-dashoffset"
}

extension StrokeDashoffset: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .length(let length):
            return length.description

        case .percentage(let percentage):
            return percentage.description

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension StrokeDashoffset: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .number(.init(value))
    }

    public init(floatLiteral value: Double) {
        self = .number(.init(value))
    }
}
