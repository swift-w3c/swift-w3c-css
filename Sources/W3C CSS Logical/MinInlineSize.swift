public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MinInlineSize: Property {

    case size(Size)

    case global(Global)
}

extension MinInlineSize {
    public static let property: String = "min-inline-size"
}

extension MinInlineSize: CustomStringConvertible {

    public var description: String {
        switch self {
        case .size(let size):
            return size.description

        case .global(let global):
            return global.description
        }
    }
}

extension MinInlineSize: LengthConvertible {
    public static func length(_ length: Length) -> MinInlineSize {
        .size(.single(length))
    }
}

extension MinInlineSize {

    public static let auto: MinInlineSize = .size(.auto)

    public static let maxContent: MinInlineSize = .size(.maxContent)

    public static let minContent: MinInlineSize = .size(.minContent)

    public static let fitContent: MinInlineSize = .size(.fitContent)

    public static let contain: MinInlineSize = .size(.contain)

    public static let cover: MinInlineSize = .size(.cover)
}

extension MinInlineSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
