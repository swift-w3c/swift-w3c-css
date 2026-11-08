public import W3C_CSS_Shared


extension FontSizeAdjust {
    public enum Metric: String, Sendable, CustomStringConvertible {

        case exHeight = "ex-height"

        case capHeight = "cap-height"

        case chWidth = "ch-width"

        case icWidth = "ic-width"

        case icHeight = "ic-height"
    }
}
