public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollMarginBottom: Property, LengthConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{

    case length(Length)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }

    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}

extension ScrollMarginBottom {
    public static let property: String = "scroll-margin-bottom"

    public var description: String {
        switch self {
        case .length(let length): return length.description
        case .global(let global): return global.description
        }
    }
}
