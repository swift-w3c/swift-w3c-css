public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderLeftStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderLeftStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderLeftStyle {
    public static let property: String = "border-left-style"

    public static let `default` = BorderLeftStyle(.none)

    public static let none = BorderLeftStyle(.none)

    public static let hidden = BorderLeftStyle(.hidden)

    public static let solid = BorderLeftStyle(.solid)

    public static let dotted = BorderLeftStyle(.dotted)

    public static let dashed = BorderLeftStyle(.dashed)

    public static let double = BorderLeftStyle(.double)

    public static let groove = BorderLeftStyle(.groove)

    public static let ridge = BorderLeftStyle(.ridge)

    public static let inset = BorderLeftStyle(.inset)

    public static let outset = BorderLeftStyle(.outset)
}
