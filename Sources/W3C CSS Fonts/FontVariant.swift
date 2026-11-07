public import W3C_CSS_Shared

public enum FontVariant: Property {

    case normal

    case none

    case smallCaps

    case combination([FontVariantOption])

    case global(Global)
}

extension FontVariant {
    public static let property: String = "font-variant"

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .none:
            return "none"

        case .smallCaps:
            return "small-caps"

        case .combination(let options):
            return options.map { $0.description }.joined(separator: " ")

        case .global(let value):
            return value.description
        }
    }
}

public enum FontVariantOption: Sendable, Hashable, CustomStringConvertible {

    case commonLigatures
    case noCommonLigatures
    case discretionaryLigatures
    case noDiscretionaryLigatures
    case historicalLigatures
    case noHistoricalLigatures
    case contextual
    case noContextual

    case smallCaps
    case allSmallCaps
    case petiteCaps
    case allPetiteCaps
    case unicase
    case titlingCaps

    case historicalForms
    case stylistic(String)
    case styleset(String)
    case characterVariant(String)
    case swash(String)
    case ornaments(String)
    case annotation(String)

    case liningNums
    case oldstyleNums
    case proportionalNums
    case tabularNums
    case diagonalFractions
    case stackedFractions
    case ordinal
    case slashedZero

    case jis78
    case jis83
    case jis90
    case jis04
    case simplified
    case traditional
    case fullWidth
    case proportionalWidth
    case ruby

    case sub
    case `super`

    case text
    case emoji
    case unicode
}

extension FontVariantOption {
    public var description: String {
        switch self {

        case .commonLigatures: return "common-ligatures"
        case .noCommonLigatures: return "no-common-ligatures"
        case .discretionaryLigatures: return "discretionary-ligatures"
        case .noDiscretionaryLigatures: return "no-discretionary-ligatures"
        case .historicalLigatures: return "historical-ligatures"
        case .noHistoricalLigatures: return "no-historical-ligatures"
        case .contextual: return "contextual"
        case .noContextual: return "no-contextual"

        case .smallCaps: return "small-caps"
        case .allSmallCaps: return "all-small-caps"
        case .petiteCaps: return "petite-caps"
        case .allPetiteCaps: return "all-petite-caps"
        case .unicase: return "unicase"
        case .titlingCaps: return "titling-caps"

        case .historicalForms: return "historical-forms"
        case .stylistic(let name): return "stylistic(\(name))"
        case .styleset(let name): return "styleset(\(name))"
        case .characterVariant(let name): return "character-variant(\(name))"
        case .swash(let name): return "swash(\(name))"
        case .ornaments(let name): return "ornaments(\(name))"
        case .annotation(let name): return "annotation(\(name))"

        case .liningNums: return "lining-nums"
        case .oldstyleNums: return "oldstyle-nums"
        case .proportionalNums: return "proportional-nums"
        case .tabularNums: return "tabular-nums"
        case .diagonalFractions: return "diagonal-fractions"
        case .stackedFractions: return "stacked-fractions"
        case .ordinal: return "ordinal"
        case .slashedZero: return "slashed-zero"

        case .jis78: return "jis78"
        case .jis83: return "jis83"
        case .jis90: return "jis90"
        case .jis04: return "jis04"
        case .simplified: return "simplified"
        case .traditional: return "traditional"
        case .fullWidth: return "full-width"
        case .proportionalWidth: return "proportional-width"
        case .ruby: return "ruby"

        case .sub: return "sub"
        case .super: return "super"

        case .text: return "text"
        case .emoji: return "emoji"
        case .unicode: return "unicode"
        }
    }
}
