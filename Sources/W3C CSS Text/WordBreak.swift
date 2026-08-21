public import W3C_CSS_Shared
import W3C_CSS_Values

public enum WordBreak: Property {

    case normal

    case breakAll

    case keepAll

    case autoPhrase

    case breakWord

    case global(Global)
}

extension WordBreak {
    public static let property: String = "word-break"
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .breakAll:
            return "break-all"

        case .keepAll:
            return "keep-all"

        case .autoPhrase:
            return "auto-phrase"

        case .breakWord:
            return "break-word"

        case .global(let global):
            return global.description
        }
    }
}
