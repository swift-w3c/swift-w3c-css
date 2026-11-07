public import W3C_CSS_Shared

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
