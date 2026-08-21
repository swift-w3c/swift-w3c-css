public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ColumnSpan: Property {

    case none

    case all

    case global(Global)
}

extension ColumnSpan {
    public static let property: String = "column-span"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .all:
            return "all"

        case .global(let global):
            return global.description
        }
    }
}
