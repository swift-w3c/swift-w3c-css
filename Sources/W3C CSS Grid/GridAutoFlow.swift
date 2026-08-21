public import W3C_CSS_Shared

public enum GridAutoFlow: Property {

    case row

    case column

    case rowDense

    case columnDense

    case global(Global)
}

extension GridAutoFlow {
    public static let property: String = "grid-auto-flow"

    public var description: String {
        switch self {
        case .row:
            return "row"

        case .column:
            return "column"

        case .rowDense:
            return "row dense"

        case .columnDense:
            return "column dense"

        case .global(let value):
            return value.description
        }
    }
}
