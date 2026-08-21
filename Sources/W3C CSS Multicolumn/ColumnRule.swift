public import W3C_CSS_Backgrounds
import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ColumnRule: Property, LineStyleConvertible {

    case full(LineStyle, BorderWidth.Width, W3C_CSS_Values.Color?)

    case styleWidth(LineStyle, BorderWidth.Width)

    case styleColor(LineStyle, W3C_CSS_Values.Color)

    case lineStyle(LineStyle)

    case global(Global)
}

extension ColumnRule {
    public static let property: String = "column-rule"

    public static func rule(
        _ style: LineStyle,
        _ width: BorderWidth.Width,
        _ color: W3C_CSS_Values.Color? = nil
    ) -> ColumnRule {
        return .full(style, width, color)
    }

    public static func rule(_ style: LineStyle, _ width: BorderWidth.Width) -> ColumnRule {
        return .styleWidth(style, width)
    }

    public static func rule(_ style: LineStyle, _ color: W3C_CSS_Values.Color) -> ColumnRule {
        return .styleColor(style, color)
    }

    public static func rule(_ lineStyle: LineStyle) -> ColumnRule {
        return .lineStyle(lineStyle)
    }

    public var description: String {
        switch self {
        case .full(let style, let width, let color):
            if let color {
                return "\(style.description) \(width.description) \(color.description)"
            } else {
                return "\(style.description) \(width.description)"
            }

        case .styleWidth(let style, let width):
            return "\(style.description) \(width.description)"

        case .styleColor(let style, let color):
            return "\(style.description) \(color.description)"

        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension ColumnRule {

    public static let thin = ColumnRule.styleWidth(.solid, .thin)

    public static let medium = ColumnRule.styleWidth(.solid, .medium)

    public static let thick = ColumnRule.styleWidth(.solid, .thick)
}
