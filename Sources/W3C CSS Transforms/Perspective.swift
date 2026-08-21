public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Perspective: Property, LengthConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{

    case none

    case length(Length)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }

    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}

extension Perspective {
    public static let property: String = "perspective"
    public var description: String {
        switch self {
        case .none: return "none"
        case .length(let length): return length.description
        case .global(let global): return global.description
        }
    }
}
