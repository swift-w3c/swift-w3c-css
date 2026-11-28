public import W3C_CSS_Shared
public import W3C_CSS_Values

public indirect enum GridTrackSize: Sendable, Hashable, CustomStringConvertible {

    case auto

    case px(Double)

    case percentage(Percentage)

    case fr(Double)

    case minContent

    case maxContent

    case minMax(MinMaxValue, MinMaxValue)

    case fitContent(LengthPercentage)

    /// A length, a percentage, a calculation such as `min(640px, 86%)`, or a variable.
    case lengthPercentage(LengthPercentage)

    /// A run of tracks inside a longer list: `repeat(4, 1fr)`.
    case `repeat`(Int, [GridTrackSize])
}
