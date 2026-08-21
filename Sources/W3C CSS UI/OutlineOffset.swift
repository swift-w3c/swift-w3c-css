public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum OutlineOffset: Property, LengthConvertible {

    case length(Length)

    case global(Global)
}

extension OutlineOffset: CustomStringConvertible {
    public static let property: String = "outline-offset"

    public var description: String {
        switch self {
        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}

extension OutlineOffset {

    public static func px(_ value: Double) -> Self {
        .length(.px(value))
    }

    public static func em(_ value: Double) -> Self {
        .length(.em(value))
    }

    public static func rem(_ value: Double) -> Self {
        .length(.rem(value))
    }
}

extension OutlineOffset: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
