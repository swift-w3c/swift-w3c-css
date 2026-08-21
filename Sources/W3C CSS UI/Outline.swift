public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Outline: Property {

    case style(OutlineStyle)

    case styleColor(OutlineStyle, OutlineColor)

    case widthStyle(OutlineWidth, OutlineStyle)

    case widthStyleColor(OutlineWidth, OutlineStyle, OutlineColor)

    case global(Global)
}

extension Outline: CustomStringConvertible {
    public static let property: String = "outline"

    public var description: String {
        switch self {
        case .style(let style):
            return style.description

        case .styleColor(let style, let color):
            return "\(style) \(color)"

        case .widthStyle(let width, let style):
            return "\(width) \(style)"

        case .widthStyleColor(let width, let style, let color):
            return "\(width) \(style) \(color)"

        case .global(let global):
            return global.description
        }
    }
}

extension Outline {

    public static func outline(
        _ width: OutlineWidth? = nil,
        _ style: OutlineStyle,
        _ color: OutlineColor? = nil
    ) -> Self {
        if let width, let color {
            return .widthStyleColor(width, style, color)
        } else if let width {
            return .widthStyle(width, style)
        } else if let color {
            return .styleColor(style, color)
        } else {
            return .style(style)
        }
    }

    public static func solid(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .solid, color)
    }

    public static func dashed(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .dashed, color)
    }

    public static func dotted(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .dotted, color)
    }

    public static func double(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .double, color)
    }
}
