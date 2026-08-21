public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderBlockStyle: Property {

    case all(LineStyle)

    case startEnd(LineStyle, LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .all(style)
    }

    public init(start: LineStyle, end: LineStyle) {
        self = .startEnd(start, end)
    }
}

extension BorderBlockStyle {
    public static let property: String = "border-block-style"
}

extension BorderBlockStyle {
    public var description: String {
        switch self {
        case .all(let style):
            return style.description

        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension BorderBlockStyle {

    public static let `default` = BorderBlockStyle(.none)

    public static let none = BorderBlockStyle(.none)

    public static let hidden = BorderBlockStyle(.hidden)

    public static let solid = BorderBlockStyle(.solid)

    public static let dotted = BorderBlockStyle(.dotted)

    public static let dashed = BorderBlockStyle(.dashed)

    public static let double = BorderBlockStyle(.double)

    public static let groove = BorderBlockStyle(.groove)

    public static let ridge = BorderBlockStyle(.ridge)

    public static let inset = BorderBlockStyle(.inset)

    public static let outset = BorderBlockStyle(.outset)
}
