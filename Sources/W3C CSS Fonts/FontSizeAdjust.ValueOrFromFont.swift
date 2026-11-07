public import W3C_CSS_Shared


extension FontSizeAdjust {
    public enum ValueOrFromFont: Sendable, Hashable, CustomStringConvertible {

        case value(Double)

        case fromFont
    }
}
