public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum MinMaxValue: Sendable, Hashable, CustomStringConvertible {

    case auto

    case px(Double)

    case percentage(Percentage)

    case fr(Double)

    case minContent

    case maxContent
}
