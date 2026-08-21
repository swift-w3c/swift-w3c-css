public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockEndStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderBlockEndStyle {
    public static let property: String = "border-block-end-style"
}

extension BorderBlockEndStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlockEndStyle {

    public static let `default` = BorderBlockEndStyle(.none)

    public static let none = BorderBlockEndStyle(.none)

    public static let hidden = BorderBlockEndStyle(.hidden)

    public static let solid = BorderBlockEndStyle(.solid)

    public static let dotted = BorderBlockEndStyle(.dotted)

    public static let dashed = BorderBlockEndStyle(.dashed)

    public static let double = BorderBlockEndStyle(.double)

    public static let groove = BorderBlockEndStyle(.groove)

    public static let ridge = BorderBlockEndStyle(.ridge)

    public static let inset = BorderBlockEndStyle(.inset)

    public static let outset = BorderBlockEndStyle(.outset)
}
