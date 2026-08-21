public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ColumnRuleStyle: Property, LineStyleConvertible {

    case lineStyle(LineStyle)

    case global(Global)
}

extension ColumnRuleStyle {
    public static let property: String = "column-rule-style"

    public static func rule(_ style: LineStyle) -> ColumnRuleStyle {
        return .lineStyle(style)
    }

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}
