public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderRightStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderRightStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderRightStyle {
    public static let property: String = "border-right-style"

    public static let `default` = BorderRightStyle(.none)

    public static let none = BorderRightStyle(.none)

    public static let hidden = BorderRightStyle(.hidden)

    public static let solid = BorderRightStyle(.solid)

    public static let dotted = BorderRightStyle(.dotted)

    public static let dashed = BorderRightStyle(.dashed)

    public static let double = BorderRightStyle(.double)

    public static let groove = BorderRightStyle(.groove)

    public static let ridge = BorderRightStyle(.ridge)

    public static let inset = BorderRightStyle(.inset)

    public static let outset = BorderRightStyle(.outset)
}
