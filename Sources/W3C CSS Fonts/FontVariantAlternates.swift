public import W3C_CSS_Shared

public enum FontVariantAlternates: Property {

    case normal

    case historicalForms

    case stylistic(String)

    case styleset(String)

    case characterVariant(String)

    case swash(String)

    case ornaments(String)

    case annotation(String)

    case combination([AlternateOption])

    case global(Global)
}

extension FontVariantAlternates {
    public static let property: String = "font-variant-alternates"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .historicalForms:
            return "historical-forms"

        case .stylistic(let name):
            return "stylistic(\(name))"

        case .styleset(let name):
            return "styleset(\(name))"

        case .characterVariant(let name):
            return "character-variant(\(name))"

        case .swash(let name):
            return "swash(\(name))"

        case .ornaments(let name):
            return "ornaments(\(name))"

        case .annotation(let name):
            return "annotation(\(name))"

        case .combination(let options):
            return options.map { $0.description }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}

public enum AlternateOption: Sendable, Hashable, CustomStringConvertible {

    case historicalForms

    case stylistic(String)

    case styleset(String)

    case characterVariant(String)

    case swash(String)

    case ornaments(String)

    case annotation(String)
}

extension AlternateOption {
    public var description: String {
        switch self {
        case .historicalForms:
            return "historical-forms"

        case .stylistic(let name):
            return "stylistic(\(name))"

        case .styleset(let name):
            return "styleset(\(name))"

        case .characterVariant(let name):
            return "character-variant(\(name))"

        case .swash(let name):
            return "swash(\(name))"

        case .ornaments(let name):
            return "ornaments(\(name))"

        case .annotation(let name):
            return "annotation(\(name))"
        }
    }
}
