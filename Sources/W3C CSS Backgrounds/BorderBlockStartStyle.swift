public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockStartStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderBlockStartStyle {
    public static let property: String = "border-block-start-style"
}

extension BorderBlockStartStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlockStartStyle {

    public static let `default` = BorderBlockStartStyle(.none)

    public static let none = BorderBlockStartStyle(.none)

    public static let hidden = BorderBlockStartStyle(.hidden)

    public static let solid = BorderBlockStartStyle(.solid)

    public static let dotted = BorderBlockStartStyle(.dotted)

    public static let dashed = BorderBlockStartStyle(.dashed)

    public static let double = BorderBlockStartStyle(.double)

    public static let groove = BorderBlockStartStyle(.groove)

    public static let ridge = BorderBlockStartStyle(.ridge)

    public static let inset = BorderBlockStartStyle(.inset)

    public static let outset = BorderBlockStartStyle(.outset)
}
