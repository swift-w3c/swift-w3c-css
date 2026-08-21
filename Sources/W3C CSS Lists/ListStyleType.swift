public import W3C_CSS_Shared

public enum ListStyleType: Property {

    case none

    case disc

    case circle

    case square

    case decimal

    case decimalLeadingZero

    case lowerRoman

    case upperRoman

    case lowerAlpha

    case upperAlpha

    case lowerLatin

    case upperLatin

    case armenian

    case georgian

    case hebrew

    case hiragana

    case hiraganaIroha

    case katakana

    case katakanaIroha

    case cjkIdeographic

    case simp

    case khmer

    case thai

    case string(CSSString)

    case custom(CustomIdent)

    case global(Global)
}

extension ListStyleType {
    public static let property: String = "list-style-type"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .disc:
            return "disc"

        case .circle:
            return "circle"

        case .square:
            return "square"

        case .decimal:
            return "decimal"

        case .decimalLeadingZero:
            return "decimal-leading-zero"

        case .lowerRoman:
            return "lower-roman"

        case .upperRoman:
            return "upper-roman"

        case .lowerAlpha:
            return "lower-alpha"

        case .upperAlpha:
            return "upper-alpha"

        case .lowerLatin:
            return "lower-latin"

        case .upperLatin:
            return "upper-latin"

        case .armenian:
            return "armenian"

        case .georgian:
            return "georgian"

        case .hebrew:
            return "hebrew"

        case .hiragana:
            return "hiragana"

        case .hiraganaIroha:
            return "hiragana-iroha"

        case .katakana:
            return "katakana"

        case .katakanaIroha:
            return "katakana-iroha"

        case .cjkIdeographic:
            return "cjk-ideographic"

        case .simp:
            return "simp-chinese-formal"

        case .khmer:
            return "khmer"

        case .thai:
            return "thai"

        case .string(let string):
            return string.description

        case .custom(let ident):
            return ident.description

        case .global(let value):
            return value.description
        }
    }
}
