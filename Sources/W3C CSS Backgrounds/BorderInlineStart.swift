public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineStart: Property {

    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)

    case global(Global)
}

extension BorderInlineStart {
    public static let property: String = "border-inline-start"
}

extension BorderInlineStart {

    public static func style(_ style: LineStyle) -> BorderInlineStart {
        .properties(width: nil, style: style, color: nil)
    }

    public static func all(
        _ width: BorderWidth.Width,
        _ style: LineStyle,
        _ color: W3C_CSS_Values.Color
    ) -> BorderInlineStart {
        .properties(width: width, style: style, color: color)
    }
}

extension BorderInlineStart {

    public init(_ style: LineStyle) {
        self = .style(style)
    }

    public init(_ width: BorderWidth.Width, _ style: LineStyle, _ color: W3C_CSS_Values.Color) {
        self = .all(width, style, color)
    }

    public init(width: BorderWidth.Width? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(width: width, style: style, color: color)
    }
}

extension BorderInlineStart: CustomStringConvertible {

    public var description: String {
        switch self {
        case .properties(let width, let style, let color):
            var parts: [String] = []

            if let width {
                parts.append(width.description)
            }

            if let style {
                parts.append(style.description)
            }

            if let color {
                parts.append(color.description)
            }

            return parts.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}
