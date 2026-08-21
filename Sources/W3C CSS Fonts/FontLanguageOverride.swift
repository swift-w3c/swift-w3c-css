public import W3C_CSS_Shared

public enum FontLanguageOverride: Property {

    case normal

    case language(CSSString)

    case global(Global)
}

extension FontLanguageOverride {
    public static let property: String = "font-language-override"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .language(let langTag):
            return langTag.description

        case .global(let global):
            return global.description
        }
    }
}

extension FontLanguageOverride {

    public static var english: FontLanguageOverride {
        .language(.init("ENG"))
    }

    public static var turkish: FontLanguageOverride {
        .language(.init("TRK"))
    }

    public static var korean: FontLanguageOverride {
        .language(.init("KOR"))
    }

    public static var danish: FontLanguageOverride {
        .language(.init("DAN"))
    }

    public static var japanese: FontLanguageOverride {
        .language(.init("JAN"))
    }
}
