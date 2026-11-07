public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum GapValue: Sendable, Hashable {

    case normal

    case length(Length)

    case percentage(Percentage)
}
