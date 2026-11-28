public enum GenericFamily: String, Sendable, Hashable {

    case serif

    case sansSerif = "sans-serif"

    case monospace

    case cursive

    case fantasy

    case systemUi = "system-ui"

    /// The system font by the name WebKit knew it by before `system-ui`.
    case appleSystem = "-apple-system"

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
