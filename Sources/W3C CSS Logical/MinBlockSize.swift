public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MinBlockSize: Property {

    case size(Size)

    case global(Global)
}

extension MinBlockSize {
    public static let property: String = "min-block-size"
}

extension MinBlockSize: CustomStringConvertible {

    public var description: String {
        switch self {
        case .size(let size):
            return size.description

        case .global(let global):
            return global.description
        }
    }
}

extension MinBlockSize: LengthConvertible {
    public static func length(_ length: Length) -> MinBlockSize {
        .size(.single(length))
    }
}

extension MinBlockSize {

    public static let auto: MinBlockSize = .size(.auto)

    public static let maxContent: MinBlockSize = .size(.maxContent)

    public static let minContent: MinBlockSize = .size(.minContent)

    public static let fitContent: MinBlockSize = .size(.fitContent)

    public static let contain: MinBlockSize = .size(.contain)

    public static let cover: MinBlockSize = .size(.cover)
}

extension MinBlockSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
