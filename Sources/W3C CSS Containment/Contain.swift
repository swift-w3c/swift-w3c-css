public import W3C_CSS_Shared
import W3C_CSS_Values

public enum Contain: Property, GlobalConvertible {

    case none

    case strict

    case content

    case size

    case inlineSize

    case layout

    case style

    case paint

    case combined([ContainValue])

    case global(Global)
}

extension Contain {
    public static let property: String = "contain"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .strict:
            return "strict"

        case .content:
            return "content"

        case .size:
            return "size"

        case .inlineSize:
            return "inline-size"

        case .layout:
            return "layout"

        case .style:
            return "style"

        case .paint:
            return "paint"

        case .combined(let values):
            return values.map(\.description).joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}

public enum ContainValue: Sendable, Hashable, CustomStringConvertible {

    case size

    case inlineSize

    case layout

    case style

    case paint
}

extension ContainValue {
    public var description: String {
        switch self {
        case .size:
            return "size"

        case .inlineSize:
            return "inline-size"

        case .layout:
            return "layout"

        case .style:
            return "style"

        case .paint:
            return "paint"
        }
    }
}

extension Contain {

    public static var sizeLayout: Self { .combined([.size, .layout]) }

    public static var sizePaint: Self { .combined([.size, .paint]) }

    public static var sizeLayoutPaint: Self { .combined([.size, .layout, .paint]) }

    public static var layoutPaint: Self { .combined([.layout, .paint]) }

    public static var layoutStyle: Self { .combined([.layout, .style]) }

    public static var layoutStylePaint: Self { .combined([.layout, .style, .paint]) }

    public static var inlineSizeLayout: Self { .combined([.inlineSize, .layout]) }

    public static var stylePaint: Self { .combined([.style, .paint]) }
}
