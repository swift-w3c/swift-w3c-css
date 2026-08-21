public import W3C_CSS_Shared

public enum StrokeMiterlimit: Property, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
    CustomStringConvertible
{

    case value(Double)

    case global(Global)

    public init(integerLiteral value: Int) {
        self = .value(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .value(value)
    }
}

extension StrokeMiterlimit {
    public static let property: String = "stroke-miterlimit"

    public var description: String {
        switch self {
        case .value(let limit):

            let clampedValue = max(1.0, limit)
            return String(clampedValue)

        case .global(let global):
            return global.description
        }
    }

    public static func limit(_ limit: Double) -> Self {
        .value(limit)
    }
}
