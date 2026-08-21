public import W3C_CSS_Shared

public enum FontVariantEmoji: Property {

    case normal

    case text

    case emoji

    case unicode

    case global(Global)
}

extension FontVariantEmoji {
    public static let property: String = "font-variant-emoji"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .text:
            return "text"

        case .emoji:
            return "emoji"

        case .unicode:
            return "unicode"

        case .global(let global):
            return global.description
        }
    }
}
