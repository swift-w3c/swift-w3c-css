public enum GenericFamily: String, Sendable, Hashable {

    case serif

    case sansSerif = "sans-serif"

    case monospace

    case cursive

    case fantasy

    case systemUi = "system-ui"

    case uiSerif = "ui-serif"

    case uiSansSerif = "ui-sans-serif"

    case uiMonospace = "ui-monospace"

    case uiRounded = "ui-rounded"

    case math

    case emoji

    case fangsong
}

extension GenericFamily: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
