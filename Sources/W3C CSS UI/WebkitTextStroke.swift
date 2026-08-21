public import W3C_CSS_Color
public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitTextStroke: Property {

    case stroke(width: StrokeWidth? = nil, color: StrokeColor? = nil)

    case global(Global)
}

extension WebkitTextStroke {
    public static let property: String = "-webkit-text-stroke"

    public enum StrokeWidth: Sendable, Hashable, CustomStringConvertible {

        case thin

        case medium

        case thick

        case length(Length)
    }

    public enum StrokeColor: Sendable, Hashable, CustomStringConvertible, ColorConvertible {

        case color(W3C_CSS_Values.Color)

        case currentColor
    }

    public static func width(_ width: StrokeWidth) -> WebkitTextStroke {
        .stroke(width: width)
    }

    public static func color(_ color: W3C_CSS_Values.Color) -> WebkitTextStroke {
        .stroke(color: .color(color))
    }

    public static func stroke(_ width: StrokeWidth, _ color: StrokeColor) -> WebkitTextStroke {
        .stroke(width: width, color: color)
    }

    public var description: String {
        switch self {
        case .stroke(let width, let color):
            var parts: [String] = []

            if let width {
                parts.append(width.description)
            }

            if let color {
                parts.append(color.description)
            }

            return parts.isEmpty ? "initial" : parts.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension WebkitTextStroke.StrokeWidth {
    public var description: String {
        switch self {
        case .thin:
            return "thin"

        case .medium:
            return "medium"

        case .thick:
            return "thick"

        case .length(let length):
            return length.description
        }
    }
}

extension WebkitTextStroke.StrokeColor {
    public var description: String {
        switch self {
        case .color(let color):
            return color.description

        case .currentColor:
            return "currentColor"
        }
    }
}
