public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderInlineStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderInlineStyle {
    public static let property: String = "border-inline-style"

    public static let `default` = BorderInlineStyle(.none)

    public static let none = BorderInlineStyle(.none)

    public static let hidden = BorderInlineStyle(.hidden)

    public static let solid = BorderInlineStyle(.solid)

    public static let dashed = BorderInlineStyle(.dashed)

    public static let dotted = BorderInlineStyle(.dotted)

    public static let double = BorderInlineStyle(.double)

    public static let groove = BorderInlineStyle(.groove)

    public static let ridge = BorderInlineStyle(.ridge)

    public static let inset = BorderInlineStyle(.inset)

    public static let outset = BorderInlineStyle(.outset)
}
