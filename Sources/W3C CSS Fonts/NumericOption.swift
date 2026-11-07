public import W3C_CSS_Shared

public enum NumericOption: String, Sendable, Hashable, CaseIterable {

    case ordinal

    case slashedZero = "slashed-zero"

    case liningNums = "lining-nums"

    case oldstyleNums = "oldstyle-nums"

    case proportionalNums = "proportional-nums"

    case tabularNums = "tabular-nums"

    case diagonalFractions = "diagonal-fractions"

    case stackedFractions = "stacked-fractions"
}
