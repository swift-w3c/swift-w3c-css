public import W3C_CSS_Shared
import W3C_CSS_Values

public enum HangingPunctuation: Property {

    case none

    case options(Set<HangingPunctuationOption>)

    case global(Global)

    public init(_ options: Set<HangingPunctuationOption>) {
        if options.isEmpty {
            self = .none
        } else {
            self = .options(options)
        }
    }

    public init(_ options: [HangingPunctuationOption]) {
        self.init(Set(options))
    }

    public init(_ options: HangingPunctuationOption...) {
        self.init(options)
    }
}

extension HangingPunctuation {
    public static let property: String = "hanging-punctuation"
}

public enum HangingPunctuationOption: String, Sendable, Hashable, CaseIterable {

    case first

    case last

    case allowEnd = "allow-end"
}

extension HangingPunctuation: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .options(let options):
            return options.map { $0.rawValue }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension HangingPunctuation {

    public static var first: HangingPunctuation {
        .options([.first])
    }

    public static var last: HangingPunctuation {
        .options([.last])
    }

    public static var allowEnd: HangingPunctuation {
        .options([.allowEnd])
    }

    public static var firstAndLast: HangingPunctuation {
        .options([.first, .last])
    }

    public static var firstAndAllowEnd: HangingPunctuation {
        .options([.first, .allowEnd])
    }

    public static var all: HangingPunctuation {
        .options([.first, .last, .allowEnd])
    }
}
