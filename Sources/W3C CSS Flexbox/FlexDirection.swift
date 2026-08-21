public import W3C_CSS_Shared

public enum FlexDirection: Property {

    case row

    case rowReverse

    case column

    case columnReverse

    case global(Global)
}

extension FlexDirection {
    public static let property: String = "flex-direction"

    public var description: String {
        switch self {
        case .row:
            return "row"

        case .rowReverse:
            return "row-reverse"

        case .column:
            return "column"

        case .columnReverse:
            return "column-reverse"

        case .global(let value):
            return value.description
        }
    }
}
