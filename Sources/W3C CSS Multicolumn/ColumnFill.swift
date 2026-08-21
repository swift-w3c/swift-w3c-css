public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ColumnFill: Property {

    case auto

    case balance

    case balanceAll

    case global(Global)
}

extension ColumnFill {
    public static let property: String = "column-fill"
}

extension ColumnFill: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .balance:
            return "balance"

        case .balanceAll:
            return "balance-all"

        case .global(let global):
            return global.description
        }
    }
}
