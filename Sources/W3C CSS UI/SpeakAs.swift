public import W3C_CSS_Shared
import W3C_CSS_Values

public enum SpeakAs: Property {

    case options(Options)

    case global(Global)

    public init(
        mode: SpeakingMode = .normal,
        digits: Bool = false,
        punctuation: PunctuationMode = .auto
    ) {
        self = .options(Options(mode: mode, digits: digits, punctuation: punctuation))
    }
}

extension SpeakAs {
    public static let property: String = "speak-as"

    public enum SpeakingMode: Sendable, Hashable, CustomStringConvertible {

        case normal

        case spellOut
    }

    public enum PunctuationMode: String, Sendable, Hashable, CustomStringConvertible {

        case auto

        case literalPunctuation = "literal-punctuation"

        case noPunctuation = "no-punctuation"
    }

    public struct Options: Sendable, Hashable, CustomStringConvertible {

        public let mode: SpeakingMode

        public let digits: Bool

        public let punctuation: PunctuationMode

        public init(
            mode: SpeakingMode = .normal,
            digits: Bool = false,
            punctuation: PunctuationMode = .auto
        ) {
            self.mode = mode
            self.digits = digits
            self.punctuation = punctuation
        }
    }
}

extension SpeakAs.SpeakingMode {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .spellOut:
            return "spell-out"
        }
    }
}

extension SpeakAs.PunctuationMode {

    public var description: String {
        return rawValue
    }
}

extension SpeakAs.Options {

    public var description: String {
        if mode == .normal && !digits && punctuation == .auto {
            return "normal"
        }

        var components: [String] = []

        if mode != .normal {
            components.append(mode.description)
        }

        if digits {
            components.append("digits")
        }

        if punctuation != .auto {
            components.append(punctuation.description)
        }

        return components.isEmpty ? "normal" : components.joined(separator: " ")
    }
}

extension SpeakAs: CustomStringConvertible {

    public var description: String {
        switch self {
        case .options(let options):
            return options.description

        case .global(let global):
            return global.description
        }
    }
}

extension SpeakAs {

    public static var normal: SpeakAs {
        .options(Options(mode: .normal, digits: false, punctuation: .auto))
    }

    public static var spellOut: SpeakAs {
        .options(Options(mode: .spellOut, digits: false, punctuation: .auto))
    }

    public static var literalPunctuation: SpeakAs {
        .options(Options(mode: .normal, digits: false, punctuation: .literalPunctuation))
    }

    public static var noPunctuation: SpeakAs {
        .options(Options(mode: .normal, digits: false, punctuation: .noPunctuation))
    }

    public static var digits: SpeakAs {
        .options(Options(mode: .normal, digits: true, punctuation: .auto))
    }
}
