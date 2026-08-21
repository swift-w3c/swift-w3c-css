public import W3C_CSS_Shared
import W3C_CSS_Values

public enum FieldSizing: Property {

    case content

    case fixed

    case global(Global)
}

extension FieldSizing {
    public static let property: String = "field-sizing"

    public var description: String {
        switch self {
        case .content:
            return "content"

        case .fixed:
            return "fixed"

        case .global(let value):
            return value.description
        }
    }
}
