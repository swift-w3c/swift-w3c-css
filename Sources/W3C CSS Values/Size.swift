public import W3C_CSS_Shared

public enum Size: Property {

    case single(Length)

    case double(width: Length, height: Length)

    case keyword(Keyword)

    case auto

    case global(Global)
}

extension Size {
    public static let property: String = "size"

    public enum Keyword: String, Sendable {

        case maxContent = "max-content"

        case minContent = "min-content"

        case fitContent = "fit-content"

        case containingBlock = "contain"

        case cover
    }
}

extension Size: LengthConvertible {
    public static func length(_ length: Length) -> Size {
        .single(length)
    }
}

extension Size: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self = .single(.px(Double(value)))
    }
}

extension Size: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        self = .single(.px(value))
    }
}

extension Size {

    public static func width(_ width: Length) -> Self {
        .single(width)
    }

    public static func height(_ height: Length) -> Self {
        .single(height)
    }

    public static func size(width: Length, height: Length) -> Self {
        .double(width: width, height: height)
    }
}

extension Size: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let length):
            return length.description

        case .double(let width, let height):
            return "\(width) \(height)"

        case .keyword(let keyword):
            return keyword.rawValue

        case .auto:
            return "auto"

        case .global(let global):
            return global.description
        }
    }
}

extension Size {

    public static let maxContent: Self = .keyword(.maxContent)

    public static let minContent: Self = .keyword(.minContent)

    public static let fitContent: Self = .keyword(.fitContent)

    public static let contain: Self = .keyword(.containingBlock)

    public static let cover: Self = .keyword(.cover)
}
