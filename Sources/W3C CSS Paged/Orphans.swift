public import W3C_CSS_Shared

public enum Orphans: Property {

    case value(Int)

    case global(Global)
}

extension Orphans {
    public static let property: String = "orphans"
}

extension Orphans: CustomStringConvertible {

    public var description: String {
        switch self {
        case .value(let value):
            return "\(max(1, value))"

        case .global(let global):
            return global.description
        }
    }
}

extension Orphans {

    public static func lines(_ value: Int) -> Orphans {
        .value(max(1, value))
    }

    public static let defaultValue: Orphans = .value(2)
}

extension Orphans: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .value(max(1, value))
    }
}
