public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BackgroundPositionY: Property {

    case keyword(Keyword)

    case lengthPercentage(LengthPercentage)

    case offset(Keyword, LengthPercentage)

    case multiple([BackgroundPositionY])

    case global(Global)
}

extension BackgroundPositionY {
    public static let property: String = "background-position-y"
}

extension BackgroundPositionY {

    public enum Keyword: String, Sendable, Hashable {

        case top

        case center

        case bottom
    }
}

extension BackgroundPositionY: CustomStringConvertible {

    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .offset(let keyword, let value):
            return "\(keyword.rawValue) \(value)"

        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}

extension BackgroundPositionY {

    public static let `default` = BackgroundPositionY.lengthPercentage(.percentage(0))

    public static let top = BackgroundPositionY.keyword(.top)

    public static let center = BackgroundPositionY.keyword(.center)

    public static let bottom = BackgroundPositionY.keyword(.bottom)

    public static func values(_ positions: [BackgroundPositionY]) -> BackgroundPositionY {
        if positions.count == 1, case let position = positions[0] {
            return position
        }
        return .multiple(positions)
    }

    public static func values(_ positions: BackgroundPositionY...) -> BackgroundPositionY {
        values(positions)
    }
}
