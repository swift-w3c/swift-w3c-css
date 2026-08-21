public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OverflowClipMargin: Property {

    case length(Length)

    case visualBox(VisualBox)

    case boxWithLength(VisualBox, Length)

    case global(Global)
}

extension OverflowClipMargin {
    public static let property: String = "overflow-clip-margin"

    public enum VisualBox: String, Sendable, Hashable {

        case contentBox = "content-box"

        case paddingBox = "padding-box"

        case borderBox = "border-box"
    }

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .visualBox(let box):
            return box.rawValue

        case .boxWithLength(let box, let length):
            return "\(box.rawValue) \(length.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension OverflowClipMargin: LengthConvertible {

    public static func px(_ value: Double) -> OverflowClipMargin {
        .length(.px(value))
    }

    public static func em(_ value: Double) -> OverflowClipMargin {
        .length(.em(value))
    }

    public static func rem(_ value: Double) -> OverflowClipMargin {
        .length(.rem(value))
    }
}

extension OverflowClipMargin: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
