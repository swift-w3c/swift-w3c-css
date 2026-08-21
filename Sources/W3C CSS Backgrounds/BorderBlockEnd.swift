public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockEnd: Property {

    case properties(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil)

    case global(Global)

    public init(
        width: BorderWidth? = nil,
        style: LineStyle? = nil,
        color: Color? = nil
    ) {
        self = .properties(width: width, style: style, color: color)
    }
}

extension BorderBlockEnd {
    public static let property: String = "border-block-end"
}

extension BorderBlockEnd: CustomStringConvertible {

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

            return parts.isEmpty ? "none" : parts.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlockEnd: LineStyleConvertible {
    public static func lineStyle(_ lineStyle: LineStyle) -> BorderBlockEnd {
        .init(style: lineStyle)
    }
}

extension BorderBlockEnd {

    public static func thin(_ style: LineStyle) -> BorderBlockEnd {
        .properties(width: .thin, style: style)
    }

    public static func medium(_ style: LineStyle) -> BorderBlockEnd {
        .properties(width: .medium, style: style)
    }

    public static func thick(_ style: LineStyle) -> BorderBlockEnd {
        .properties(width: .thick, style: style)
    }
}
