public import W3C_CSS_Shared
import W3C_CSS_Values


extension MaskOrigin {
    public enum Origin: String, Sendable, Hashable {

        case borderBox = "border-box"

        case paddingBox = "padding-box"

        case contentBox = "content-box"

        case fillBox = "fill-box"

        case strokeBox = "stroke-box"

        case viewBox = "view-box"
    }
}
