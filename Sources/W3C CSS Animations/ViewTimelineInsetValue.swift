public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum ViewTimelineInsetValue: Sendable, Hashable {

    case auto

    case length(Length)

    case percentage(Percentage)
}
