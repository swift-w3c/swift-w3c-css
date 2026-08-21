public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ColumnRuleColor: Property, ColorConvertible, GlobalConvertible {

    case color(W3C_CSS_Values.Color)

    case global(Global)
}

extension ColumnRuleColor {
    public static let property: String = "column-rule-color"

    public static func rule(_ color: W3C_CSS_Values.Color) -> ColumnRuleColor {
        return .color(color)
    }

    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}
