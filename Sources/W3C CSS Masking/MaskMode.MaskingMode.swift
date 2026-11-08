public import W3C_CSS_Shared
import W3C_CSS_Values

extension MaskMode {
    public enum MaskingMode: String, Sendable, Hashable {

        case alpha

        case luminance

        case matchSource = "match-source"
    }
}
