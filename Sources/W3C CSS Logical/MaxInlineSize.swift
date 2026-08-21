public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaxInlineSize: Property {

    case size(Size)

    case none

    case global(Global)
}

extension MaxInlineSize {
    public static let property: String = "max-inline-size"
}

extension MaxInlineSize: CustomStringConvertible {

    public var description: String {
        switch self {
        case .size(let size):
            return size.description

        case .none:
            return "none"

        case .global(let global):
            return global.description
        }
    }
}

extension MaxInlineSize: LengthConvertible {
    public static func length(_ length: Length) -> MaxInlineSize {
        .size(.single(length))
    }
}

extension MaxInlineSize {

    public static let maxContent: MaxInlineSize = .size(.maxContent)

    public static let minContent: MaxInlineSize = .size(.minContent)

    public static let fitContent: MaxInlineSize = .size(.fitContent)

    public static let contain: MaxInlineSize = .size(.contain)

    public static let cover: MaxInlineSize = .size(.cover)
}

extension MaxInlineSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
