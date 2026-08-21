public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBottom: Property {

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

extension BorderBottom {
    public static let property: String = "border-bottom"
}

extension BorderBottom: LineStyleConvertible {

    public static func lineStyle(_ lineStyle: LineStyle) -> BorderBottom {
        return .properties(Properties(style: lineStyle))
    }
}

extension BorderBottom {

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

extension BorderBottom.Properties {

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

extension BorderBottom: CustomStringConvertible {

    public var description: String {
        switch self {
        case .properties(let properties):
            return properties.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBottom {

    public static let none = BorderBottom(.none)

    public static let hidden = BorderBottom(.hidden)

    public static let solid = BorderBottom(.solid)

    public static let dotted = BorderBottom(.dotted)

    public static let dashed = BorderBottom(.dashed)

    public static let double = BorderBottom(.double)

    public static let groove = BorderBottom(.groove)

    public static let ridge = BorderBottom(.ridge)

    public static let inset = BorderBottom(.inset)

    public static let outset = BorderBottom(.outset)

    public static func thin(_ style: LineStyle) -> BorderBottom {
        .properties(Properties(width: .thin, style: style))
    }

    public static func medium(_ style: LineStyle) -> BorderBottom {
        .properties(Properties(width: .medium, style: style))
    }

    public static func thick(_ style: LineStyle) -> BorderBottom {
        .properties(Properties(width: .thick, style: style))
    }
}
