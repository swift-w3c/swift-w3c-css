public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderInlineStartStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderInlineStartStyle {
    public static let property: String = "border-inline-start-style"
}

extension BorderInlineStartStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderInlineStartStyle {

    public static let `default` = BorderInlineStartStyle(.none)

    public static let none = BorderInlineStartStyle(.none)

    public static let hidden = BorderInlineStartStyle(.hidden)

    public static let dotted = BorderInlineStartStyle(.dotted)

    public static let dashed = BorderInlineStartStyle(.dashed)

    public static let solid = BorderInlineStartStyle(.solid)

    public static let double = BorderInlineStartStyle(.double)

    public static let groove = BorderInlineStartStyle(.groove)

    public static let ridge = BorderInlineStartStyle(.ridge)

    public static let inset = BorderInlineStartStyle(.inset)

    public static let outset = BorderInlineStartStyle(.outset)
}
