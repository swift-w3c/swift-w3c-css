public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineEnd: Property {

    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)

    case global(Global)
}

extension BorderInlineEnd {
    public static let property: String = "border-inline-end"
}

extension BorderInlineEnd {

    public static func style(_ style: LineStyle) -> BorderInlineEnd {
        .properties(width: nil, style: style, color: nil)
    }

    public static func all(
        _ width: BorderWidth.Width,
        _ style: LineStyle,
        _ color: W3C_CSS_Values.Color
    ) -> BorderInlineEnd {
        .properties(width: width, style: style, color: color)
    }
}

extension BorderInlineEnd {

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

extension BorderInlineEnd: CustomStringConvertible {

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

extension BorderInlineEnd {

    public static let none = BorderInlineEnd(.none)

    public static let hidden = BorderInlineEnd(.hidden)

    public static let solid = BorderInlineEnd(.solid)

    public static let dotted = BorderInlineEnd(.dotted)

    public static let dashed = BorderInlineEnd(.dashed)

    public static let double = BorderInlineEnd(.double)

    public static let groove = BorderInlineEnd(.groove)

    public static let ridge = BorderInlineEnd(.ridge)

    public static let inset = BorderInlineEnd(.inset)

    public static let outset = BorderInlineEnd(.outset)

}
