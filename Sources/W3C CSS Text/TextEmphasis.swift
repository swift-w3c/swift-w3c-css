public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextEmphasis: Property {

    case config(Configuration)

    case global(Global)

    public init(style: TextEmphasisStyle, color: TextEmphasisColor? = nil) {
        if case .global(let global) = style {
            self = .global(global)
        } else {
            self = .config(Configuration(style: style, color: color))
        }
    }

    public init(shape: EmphasisShape, fill: EmphasisFill = .filled, color: TextEmphasisColor? = nil)
    {
        self = .config(Configuration(style: .shape(shape, fill), color: color))
    }

    public init(string: CSSString, color: TextEmphasisColor? = nil) {
        self = .config(Configuration(style: .string(string), color: color))
    }
}

extension TextEmphasis {
    public static let property: String = "text-emphasis"
}

extension TextEmphasis {

    public struct Configuration: Sendable, Hashable, CustomStringConvertible {

        public let style: TextEmphasisStyle

        public let color: TextEmphasisColor?

        public init(style: TextEmphasisStyle, color: TextEmphasisColor? = nil) {
            self.style = style
            self.color = color
        }
    }
}

extension TextEmphasis.Configuration {

    public var description: String {
        if let color {
            return "\(style) \(color)"
        }

        return style.description
    }
}

extension TextEmphasis: CustomStringConvertible {

    public var description: String {
        switch self {
        case .config(let config):
            return config.description

        case .global(let global):
            return global.description
        }
    }
}

extension TextEmphasis {

    public static var none: TextEmphasis {
        .config(Configuration(style: .none))
    }

    public static func filledDot(color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .filledDot, color: color))
    }

    public static func filledCircle(color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .filledCircle, color: color))
    }

    public static func filledTriangle(color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .filledTriangle, color: color))
    }

    public static func character(_ char: String, color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .string(.init(char)), color: color))
    }
}
