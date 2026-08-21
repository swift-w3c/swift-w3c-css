public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineEndStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderInlineEndStyle {
    public static let property: String = "border-inline-end-style"
}

extension BorderInlineEndStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderInlineEndStyle {

    public static let `default` = BorderInlineEndStyle(.none)

    public static let none = BorderInlineEndStyle(.none)

    public static let hidden = BorderInlineEndStyle(.hidden)

    public static let dotted = BorderInlineEndStyle(.dotted)

    public static let dashed = BorderInlineEndStyle(.dashed)

    public static let solid = BorderInlineEndStyle(.solid)

    public static let double = BorderInlineEndStyle(.double)

    public static let groove = BorderInlineEndStyle(.groove)

    public static let ridge = BorderInlineEndStyle(.ridge)

    public static let inset = BorderInlineEndStyle(.inset)

    public static let outset = BorderInlineEndStyle(.outset)
}
