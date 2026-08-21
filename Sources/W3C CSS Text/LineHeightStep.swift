public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum LineHeightStep: Property, LengthConvertible, ExpressibleByFloatLiteral,
    ExpressibleByIntegerLiteral
{

    case length(Length)

    case global(Global)

    public init(floatLiteral value: Double) {
        self = .px(value)
    }

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }
}

extension LineHeightStep {
    public static let property: String = "line-height-step"

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}
