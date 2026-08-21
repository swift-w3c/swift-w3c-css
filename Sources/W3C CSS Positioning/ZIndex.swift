public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ZIndex: Property {

    case auto

    case integer(Int)

    case global(Global)
}

extension ZIndex {
    public static let property: String = "z-index"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .integer(let value):
            return "\(value)"

        case .global(let global):
            return global.description
        }
    }
}

extension ZIndex: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .integer(value)
    }
}
