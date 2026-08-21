public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MaxBlockSize: Property {

    case size(Size)

    case none

    case global(Global)
}

extension MaxBlockSize {
    public static let property: String = "max-block-size"
}

extension MaxBlockSize: CustomStringConvertible {

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

extension MaxBlockSize: LengthConvertible {
    public static func length(_ length: Length) -> MaxBlockSize {
        .size(.single(length))
    }
}

extension MaxBlockSize {

    public static let maxContent: MaxBlockSize = .size(.maxContent)

    public static let minContent: MaxBlockSize = .size(.minContent)

    public static let fitContent: MaxBlockSize = .size(.fitContent)

    public static let contain: MaxBlockSize = .size(.contain)

    public static let cover: MaxBlockSize = .size(.cover)
}

extension MaxBlockSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
