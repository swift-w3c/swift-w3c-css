import W3C_CSS_Shared

public enum Position: Sendable, Hashable {

    case keyword(Keyword)

    case value(LengthPercentage)

    case keywords(Keyword, Keyword)

    case keywordValue(Keyword, LengthPercentage)

    case valueKeyword(LengthPercentage, Keyword)

    case values(LengthPercentage, LengthPercentage)

    case offsets(Keyword, LengthPercentage, Keyword, LengthPercentage)
}

extension Position {

    public enum Keyword: String, Sendable, Hashable {

        case center

        case top

        case right

        case bottom

        case left
    }

    public static let center: Position = .keyword(.center)

    public static let top: Position = .keyword(.top)

    public static let right: Position = .keyword(.right)

    public static let bottom: Position = .keyword(.bottom)

    public static let left: Position = .keyword(.left)

    public static let topLeft: Position = .keywords(.top, .left)

    public static let topRight: Position = .keywords(.top, .right)

    public static let bottomLeft: Position = .keywords(.bottom, .left)

    public static let bottomRight: Position = .keywords(.bottom, .right)

}

extension Position: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> Position {
        .value(value)
    }
}

extension Position: CustomStringConvertible {

    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue

        case .value(let value):
            return value.description

        case .keywords(let keyword1, let keyword2):
            return "\(keyword1.rawValue) \(keyword2.rawValue)"

        case .keywordValue(let keyword, let value):
            return "\(keyword.rawValue) \(value)"

        case .valueKeyword(let value, let keyword):
            return "\(value) \(keyword.rawValue)"

        case .values(let value1, let value2):
            return "\(value1) \(value2)"

        case .offsets(let keyword1, let offset1, let keyword2, let offset2):
            return "\(keyword1.rawValue) \(offset1) \(keyword2.rawValue) \(offset2)"
        }
    }
}
