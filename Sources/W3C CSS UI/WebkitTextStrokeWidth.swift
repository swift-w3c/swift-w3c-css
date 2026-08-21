public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum WebkitTextStrokeWidth: Property, LengthConvertible {

    case thin

    case medium

    case thick

    case length(Length)

    case global(Global)

    public init(_ length: Length) {
        self = .length(length)
    }
}

extension WebkitTextStrokeWidth {
    public static let property: String = "-webkit-text-stroke-width"

    public var description: String {
        switch self {
        case .thin:
            return "thin"

        case .medium:
            return "medium"

        case .thick:
            return "thick"

        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}
