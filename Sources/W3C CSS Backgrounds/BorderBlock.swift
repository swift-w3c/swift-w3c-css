public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlock: Property, LineStyleConvertible {

    case lineStyle(LineStyle)

    case styleAndColor(LineStyle, Color)

    case widthAndStyle(BorderWidth, LineStyle)

    case all(BorderWidth, LineStyle, Color)

    case width(BorderWidth)

    case global(Global)

}

extension BorderBlock {
    public static let property: String = "border-block"
}

extension BorderBlock: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .styleAndColor(let style, let color):
            return "\(style.description) \(color.description)"

        case .widthAndStyle(let width, let style):
            return "\(width.description) \(style.description)"

        case .all(let width, let style, let color):
            return "\(width.description) \(style.description) \(color.description)"

        case .width(let width):
            return width.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlock {

    public static func thin(_ style: LineStyle) -> BorderBlock {
        .widthAndStyle(.thin, style)
    }

    public static func medium(_ style: LineStyle) -> BorderBlock {
        .widthAndStyle(.medium, style)
    }

    public static func thick(_ style: LineStyle) -> BorderBlock {
        .widthAndStyle(.thick, style)
    }
}
