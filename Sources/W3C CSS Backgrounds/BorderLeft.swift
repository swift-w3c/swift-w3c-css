public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderLeft: Property {

    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)

    case global(Global)
}

extension BorderLeft {
    public static let property: String = "border-left"

    public static func style(_ style: LineStyle) -> BorderLeft {
        .properties(width: nil, style: style, color: nil)
    }

    public static func all(
        _ width: BorderWidth.Width,
        _ style: LineStyle,
        _ color: W3C_CSS_Values.Color
    ) -> BorderLeft {
        .properties(width: width, style: style, color: color)
    }
}

extension BorderLeft {

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

extension BorderLeft: CustomStringConvertible {

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

extension BorderLeft {

    public static let none = BorderLeft(.none)

    public static let hidden = BorderLeft(.hidden)

    public static let solid = BorderLeft(.solid)

    public static let dotted = BorderLeft(.dotted)

    public static let dashed = BorderLeft(.dashed)

    public static let double = BorderLeft(.double)

    public static let groove = BorderLeft(.groove)

    public static let ridge = BorderLeft(.ridge)

    public static let inset = BorderLeft(.inset)

    public static let outset = BorderLeft(.outset)

}
