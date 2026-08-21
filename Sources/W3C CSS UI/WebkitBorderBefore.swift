public import W3C_CSS_Backgrounds
import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitBorderBefore: Property {

    case properties(
        width: BorderWidth? = nil,
        style: LineStyle? = nil,
        color: W3C_CSS_Values.Color? = nil
    )

    case global(Global)

    public init(
        width: BorderWidth? = nil,
        style: LineStyle? = nil,
        color: W3C_CSS_Values.Color? = nil
    ) {
        self = .properties(width: width, style: style, color: color)
    }
}

extension WebkitBorderBefore: CustomStringConvertible {
    public static let property: String = "-webkit-border-before"

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

extension WebkitBorderBefore: LineStyleConvertible {
    public static func lineStyle(_ lineStyle: LineStyle) -> WebkitBorderBefore {
        .properties(style: lineStyle)
    }
}

extension WebkitBorderBefore {

    public static func thin(_ style: LineStyle) -> WebkitBorderBefore {
        .properties(width: .thin, style: style)
    }

    public static func medium(_ style: LineStyle) -> WebkitBorderBefore {
        .properties(width: .medium, style: style)
    }

    public static func thick(_ style: LineStyle) -> WebkitBorderBefore {
        .properties(width: .thick, style: style)
    }
}
