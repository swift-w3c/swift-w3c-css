public import W3C_CSS_Shared
import W3C_CSS_Values

public enum HyphenateLimitChars: Property {

    case auto

    case minimumWordLength(Int)

    case minimumWordLengthAndBefore(Int, Int)

    case all(Int, Int, Int)

    case mixed(wordLength: Int, before: HyphenLimit, after: HyphenLimit)

    case global(Global)
}

extension HyphenateLimitChars {
    public static let property: String = "hyphenate-limit-chars"
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .minimumWordLength(let length):
            return "\(length)"

        case .minimumWordLengthAndBefore(let length, let before):
            return "\(length) \(before)"

        case .all(let length, let before, let after):
            return "\(length) \(before) \(after)"

        case .mixed(let wordLength, let before, let after):
            let beforeStr = before.description
            let afterStr = after.description
            return "\(wordLength) \(beforeStr) \(afterStr)"

        case .global(let global):
            return global.description
        }
    }
}

public enum HyphenLimit: Sendable, Hashable, CustomStringConvertible {
    case auto
    case value(Int)
}

extension HyphenLimit {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .value(let val):
            return "\(val)"
        }
    }
}
