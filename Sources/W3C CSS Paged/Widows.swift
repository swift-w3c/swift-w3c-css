public import W3C_CSS_Shared

public enum Widows: Property {

    case integer(Int)

    case global(Global)
}

extension Widows {
    public static let property: String = "widows"

    public var description: String {
        switch self {
        case .integer(let value):
            return "\(value)"

        case .global(let global):
            return global.description
        }
    }
}

extension Widows: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .integer(value)
    }
}
