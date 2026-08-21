public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderTop: Property {

    case properties(Properties)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .properties(Properties(style: style))
    }

    public init(_ width: BorderWidth, _ style: LineStyle) {
        self = .properties(Properties(width: width, style: style))
    }

    public init(_ style: LineStyle, _ color: Color) {
        self = .properties(Properties(style: style, color: color))
    }

    public init(_ width: BorderWidth, _ style: LineStyle, _ color: Color) {
        self = .properties(Properties(width: width, style: style, color: color))
    }

    public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(Properties(width: width, style: style, color: color))
    }
}

extension BorderTop {

    public struct Properties: Sendable, Hashable, CustomStringConvertible {

        public let width: BorderWidth?

        public let style: LineStyle?

        public let color: Color?

        public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
            self.width = width
            self.style = style
            self.color = color
        }
    }
}

extension BorderTop.Properties {

    public var description: String {
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
    }
}

extension BorderTop: CustomStringConvertible {

    public var description: String {
        switch self {
        case .properties(let properties):
            return properties.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderTop {
    public static let property: String = "border-top"

    public static let none = BorderTop(.none)

    public static let hidden = BorderTop(.hidden)

    public static let solid = BorderTop(.solid)

    public static let dotted = BorderTop(.dotted)

    public static let dashed = BorderTop(.dashed)

    public static let double = BorderTop(.double)

    public static let groove = BorderTop(.groove)

    public static let ridge = BorderTop(.ridge)

    public static let inset = BorderTop(.inset)

    public static let outset = BorderTop(.outset)

    public static func thin(_ style: LineStyle) -> BorderTop {
        .properties(Properties(width: .thin, style: style))
    }

    public static func medium(_ style: LineStyle) -> BorderTop {
        .properties(Properties(width: .medium, style: style))
    }

    public static func thick(_ style: LineStyle) -> BorderTop {
        .properties(Properties(width: .thick, style: style))
    }
}
