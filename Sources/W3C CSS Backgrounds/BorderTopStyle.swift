public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderTopStyle: Property {

    case lineStyle(LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

extension BorderTopStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description

        case .global(let global):
            return global.description
        }
    }
}

extension BorderTopStyle {
    public static let property: String = "border-top-style"

    public static let `default` = BorderTopStyle(.none)

    public static let none = BorderTopStyle(.none)

    public static let hidden = BorderTopStyle(.hidden)

    public static let solid = BorderTopStyle(.solid)

    public static let dotted = BorderTopStyle(.dotted)

    public static let dashed = BorderTopStyle(.dashed)

    public static let double = BorderTopStyle(.double)

    public static let groove = BorderTopStyle(.groove)

    public static let ridge = BorderTopStyle(.ridge)

    public static let inset = BorderTopStyle(.inset)

    public static let outset = BorderTopStyle(.outset)
}
