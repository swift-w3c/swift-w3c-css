public import W3C_CSS_Shared

public enum Order: Property {

    case value(Int)

    case global(Global)
}

extension Order {
    public static let property: String = "order"
}

extension Order: CustomStringConvertible {

    public var description: String {
        switch self {
        case .value(let value):
            return "\(value)"

        case .global(let global):
            return global.description
        }
    }
}

extension Order {

    public static let defaultValue: Order = .value(0)
}

extension Order: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .value(value)
    }
}
