public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ColumnCount: Property {

    case auto

    case count(Int)

    case global(Global)
}

extension ColumnCount {
    public static let property: String = "column-count"

    public static func columns(_ count: Int) -> ColumnCount {

        return .count(max(1, count))
    }

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .count(let count):
            return "\(count)"

        case .global(let global):
            return global.description
        }
    }
}

extension ColumnCount: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .count(max(1, value))
    }
}
