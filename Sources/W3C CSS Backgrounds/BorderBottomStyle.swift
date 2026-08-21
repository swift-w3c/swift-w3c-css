public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBottomStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderBottomStyle {
    public static let property: String = "border-bottom-style"
}

extension BorderBottomStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBottomStyle {

    public static let `default` = BorderBottomStyle(.none)

    public static let none = BorderBottomStyle(.none)

    public static let hidden = BorderBottomStyle(.hidden)

    public static let solid = BorderBottomStyle(.solid)

    public static let dotted = BorderBottomStyle(.dotted)

    public static let dashed = BorderBottomStyle(.dashed)

    public static let double = BorderBottomStyle(.double)

    public static let groove = BorderBottomStyle(.groove)

    public static let ridge = BorderBottomStyle(.ridge)

    public static let inset = BorderBottomStyle(.inset)

    public static let outset = BorderBottomStyle(.outset)
}
