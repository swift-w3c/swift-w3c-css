public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ColumnRuleWidth: Property, LengthConvertible {

    case thin
    case medium
    case thick

    case length(Length)

    case global(Global)
}

extension ColumnRuleWidth {
    public static let property: String = "column-rule-width"
}

extension ColumnRuleWidth: CustomStringConvertible {
    public var description: String {
        switch self {
        case .thin:
            return "thin"

        case .medium:
            return "medium"

        case .thick:
            return "thick"

        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}
