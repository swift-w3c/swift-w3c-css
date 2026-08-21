public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ScrollMarginInlineStart: Property, LengthConvertible, ExpressibleByIntegerLiteral,
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

extension ScrollMarginInlineStart {
    public static let property: String = "scroll-margin-inline-start"

    public var description: String {
        switch self {
        case .length(let length): return length.description
        case .global(let global): return global.description
        }
    }
}
