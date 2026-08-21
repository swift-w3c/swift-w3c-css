public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum Border: Property {

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

extension Border {
    public static let property: String = "border"
}

extension Border: CustomStringConvertible {

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

extension Border {

    public static let none = Border.properties(style: LineStyle.none)

    public static let hidden = Border.properties(style: .hidden)

    public static let solid = Border.properties(style: .solid)

    public static let dotted = Border.properties(style: .dotted)

    public static let dashed = Border.properties(style: .dashed)

    public static let double = Border.properties(style: .double)

    public static let groove = Border.properties(style: .groove)

    public static let ridge = Border.properties(style: .ridge)

    public static let inset = Border.properties(style: .inset)

    public static let outset = Border.properties(style: .outset)

    public static func thin(_ style: LineStyle) -> Border {
        .properties(width: .thin, style: style)
    }

    public static func medium(_ style: LineStyle) -> Border {
        .properties(width: .medium, style: style)
    }

    public static func thick(_ style: LineStyle) -> Border {
        .properties(width: .thick, style: style)
    }
}
