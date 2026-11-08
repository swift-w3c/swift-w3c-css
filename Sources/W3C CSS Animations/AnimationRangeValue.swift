public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationRangeValue: Sendable, Hashable, LengthPercentageConvertible {

    case normal

    case lengthPercentage(LengthPercentage)

    case namedRange(TimelineRangeName, Percentage? = nil)
}
