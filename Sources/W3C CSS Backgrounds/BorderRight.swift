public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderRight: Property {

    case properties(Properties)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .properties(Properties(style: style))
    }

    public init(_ width: BorderWidth, _ style: LineStyle) {
        self = .properties(Properties(width: width, style: style))
    }

    public init(_ style: LineStyle, _ color: W3C_CSS_Values.Color) {
        self = .properties(Properties(style: style, color: color))
    }

    public init(_ width: BorderWidth, _ style: LineStyle, _ color: W3C_CSS_Values.Color) {
        self = .properties(Properties(width: width, style: style, color: color))
    }

    public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(Properties(width: width, style: style, color: color))
    }
}

extension BorderRight {

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

extension BorderRight.Properties {

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

extension BorderRight: CustomStringConvertible {

    public var description: String {
        switch self {
        case .properties(let properties):
            return properties.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderRight {
    public static let property: String = "border-right"

    public static let none = BorderRight(.none)

    public static let hidden = BorderRight(.hidden)

    public static let solid = BorderRight(.solid)

    public static let dotted = BorderRight(.dotted)

    public static let dashed = BorderRight(.dashed)

    public static let double = BorderRight(.double)

    public static let groove = BorderRight(.groove)

    public static let ridge = BorderRight(.ridge)

    public static let inset = BorderRight(.inset)

    public static let outset = BorderRight(.outset)

    public static func thin(_ style: LineStyle) -> BorderRight {
        .properties(Properties(width: .thin, style: style))
    }

    public static func medium(_ style: LineStyle) -> BorderRight {
        .properties(Properties(width: .medium, style: style))
    }

    public static func thick(_ style: LineStyle) -> BorderRight {
        .properties(Properties(width: .thick, style: style))
    }
}
