public enum Quotes: Property {

    case none

    case auto

    case strings([Pair])

    case global(Global)

}

extension Quotes {
    public static let property: String = "quotes"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .auto:
            return "auto"

        case .strings(let pairs):
            return pairs.flatMap { pair in ["\"\([pair.first])\"", "\"\(pair.second)\""] }.joined(
                separator: " "
            )

        case .global(let global):
            return global.description
        }
    }

    public static func pair(_ opening: String, _ closing: String) -> Quotes {
        .strings([.init(opening, closing)])
    }

    public static var doubleQuotes: Quotes {
        .pair("\"", "\"")
    }

    public static var singleQuotes: Quotes {
        .pair("'", "'")
    }

    public static var englishNestedQuotes: Quotes {
        .strings([.init("\"", "\""), .init("'", "'")])
    }

    public static var frenchQuotes: Quotes {
        .pair("«", "»")
    }

    public static var germanQuotes: Quotes {
        .pair("„", "\"")
    }
}
