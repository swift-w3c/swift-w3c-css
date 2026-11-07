public import W3C_CSS_Shared

public enum AlternateOption: Sendable, Hashable, CustomStringConvertible {

    case historicalForms

    case stylistic(String)

    case styleset(String)

    case characterVariant(String)

    case swash(String)

    case ornaments(String)

    case annotation(String)
}
