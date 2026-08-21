public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Left: Property, LengthPercentageConvertible {

    case lengthPercentage(LengthPercentage)

    case auto

    case global(Global)
}

extension Left {
    public static let property: String = "left"

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}

extension Left {

    public static let zero: Left = .px(0)
}

extension Left: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
