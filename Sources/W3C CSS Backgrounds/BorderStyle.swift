public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BorderStyle: Property {

    case all(LineStyle)

    case verticalHorizontal(LineStyle, LineStyle)

    case topHorizontalBottom(LineStyle, LineStyle, LineStyle)

    case topRightBottomLeft(LineStyle, LineStyle, LineStyle, LineStyle)

    case global(Global)

    public init(_ style: LineStyle) {
        self = .all(style)
    }

    public init(_ vertical: LineStyle, _ horizontal: LineStyle) {
        self = .verticalHorizontal(vertical, horizontal)
    }

    public init(_ top: LineStyle, _ horizontal: LineStyle, _ bottom: LineStyle) {
        self = .topHorizontalBottom(top, horizontal, bottom)
    }

    public init(_ top: LineStyle, _ right: LineStyle, _ bottom: LineStyle, _ left: LineStyle) {
        self = .topRightBottomLeft(top, right, bottom, left)
    }
}

extension BorderStyle: CustomStringConvertible {

    public var description: String {
        switch self {
        case .all(let style):
            return style.description

        case .verticalHorizontal(let vertical, let horizontal):
            return "\(vertical.description) \(horizontal.description)"

        case .topHorizontalBottom(let top, let horizontal, let bottom):
            return "\(top.description) \(horizontal.description) \(bottom.description)"

        case .topRightBottomLeft(let top, let right, let bottom, let left):
            return
                "\(top.description) \(right.description) \(bottom.description) \(left.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension BorderStyle {
    public static let property: String = "border-style"

    public static let `default` = BorderStyle(.none)

    public static let none = BorderStyle(.none)

    public static let hidden = BorderStyle(.hidden)

    public static let solid = BorderStyle(.solid)

    public static let dotted = BorderStyle(.dotted)

    public static let dashed = BorderStyle(.dashed)

    public static let double = BorderStyle(.double)

    public static let groove = BorderStyle(.groove)

    public static let ridge = BorderStyle(.ridge)

    public static let inset = BorderStyle(.inset)

    public static let outset = BorderStyle(.outset)
}
