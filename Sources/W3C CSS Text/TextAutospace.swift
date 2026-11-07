public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextAutospace: Property {

    case none

    case options(Set<TextAutospaceOption>)

    case global(Global)

    public init(_ options: [TextAutospaceOption]) {
        self.init(Set(options))
    }

    public init(_ options: Set<TextAutospaceOption>) {
        if options.isEmpty {
            self = .none
        } else {
            self = .options(options)
        }
    }

    public init(_ options: TextAutospaceOption...) {
        self.init(options)
    }
}

extension TextAutospace {
    public static let property: String = "text-autospace"
}

public enum TextAutospaceOption: String, Sendable, Hashable, CaseIterable {

    case ideographAlpha = "ideograph-alpha"

    case ideographNumeric = "ideograph-numeric"

    case ideographParenthesis = "ideograph-parenthesis"

    case punctuation = "punctuation"

    case all = "all"
}

extension TextAutospace: CustomStringConvertible {

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

extension TextAutospace {

    public static func ideographicLatinSpacing() -> Self {
        .options([.ideographAlpha])
    }

    public static func fullIdeographicSpacing() -> Self {
        .options([.ideographAlpha, .ideographNumeric, .ideographParenthesis])
    }

    public static func maxSpacing() -> Self {
        .options([.all])
    }
}
