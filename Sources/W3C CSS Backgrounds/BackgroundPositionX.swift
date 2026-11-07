public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum BackgroundPositionX: Property, LengthPercentageConvertible {

    case keyword(Keyword)

    case lengthPercentage(LengthPercentage)

    case offset(Keyword, LengthPercentage)

    case multiple([BackgroundPositionX])

    case global(Global)

}

extension BackgroundPositionX {
    public static let property: String = "background-position-x"
}

extension BackgroundPositionX {

    public enum Keyword: String, Sendable, Hashable {

        case left

        case center

        case right
    }
}

extension BackgroundPositionX: CustomStringConvertible {

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

extension BackgroundPositionX {

    public static let `default` = BackgroundPositionX.zero

    public static let left = BackgroundPositionX.keyword(.left)

    public static let center = BackgroundPositionX.keyword(.center)

    public static let right = BackgroundPositionX.keyword(.right)
}
