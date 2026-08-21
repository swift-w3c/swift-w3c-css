public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInline: Property {

    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)

    case global(Global)
}

extension BorderInline {
    public static let property: String = "border-inline"
}

extension BorderInline {

    public static func style(_ style: LineStyle) -> BorderInline {
        .properties(width: nil, style: style, color: nil)
    }

    public static func all(
        _ width: BorderWidth.Width,
        _ style: LineStyle,
        _ color: W3C_CSS_Values.Color
    ) -> BorderInline {
        .properties(width: width, style: style, color: color)
    }
}

extension BorderInline {

    public init(_ width: BorderWidth.Width, _ style: LineStyle, _ color: W3C_CSS_Values.Color) {
        self = .all(width, style, color)
    }

    public init(width: BorderWidth.Width? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(width: width, style: style, color: color)
    }
}

extension BorderInline: CustomStringConvertible {

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

extension BorderInline {

    public static func thin(_ style: LineStyle) -> BorderInline {
        .init(width: .thin, style: style)
    }

    public static func medium(_ style: LineStyle) -> BorderInline {
        .init(width: .medium, style: style)
    }

    public static func thick(_ style: LineStyle) -> BorderInline {
        .init(width: .thick, style: style)
    }
}
