public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OutlineWidth: Property, LengthConvertible {

    case length(Length)

    case thin

    case medium

    case thick

    case global(Global)
}

extension OutlineWidth: CustomStringConvertible {
    public static let property: String = "outline-width"

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .thin:
            return "thin"

        case .medium:
            return "medium"

        case .thick:
            return "thick"

        case .global(let global):
            return global.description
        }
    }
}

extension OutlineWidth: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
