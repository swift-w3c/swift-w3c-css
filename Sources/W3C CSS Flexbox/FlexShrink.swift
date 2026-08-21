public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum FlexShrink: Property, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    case number(Number)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .number(.init(value))
    }

    public init(floatLiteral value: Double) {
        self = .number(.init(value))
    }
}

extension FlexShrink {
    public static let property: String = "flex-shrink"

    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .global(let value):
            return value.description
        }
    }
}
