public import W3C_CSS_Shared

public enum Scale: Property, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
    CustomStringConvertible
{

    case none

    case single(Double)

    case xy(Double, Double)

    case xyz(Double, Double, Double)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .single(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .single(value)
    }
}

extension Scale {
    public static let property: String = "scale"
    public var description: String {
        switch self {
        case .none: return "none"

        case .single(let value):
            return value.formatted(.number)

        case .xy(let x, let y):
            return "\(x.formatted(.number)) \(y.formatted(.number))"

        case .xyz(let x, let y, let z):
            return "\(x.formatted(.number)) \(y.formatted(.number)) \(z.formatted(.number))"

        case .global(let global):
            return global.description
        }
    }
}

extension Scale: GlobalConvertible {}
