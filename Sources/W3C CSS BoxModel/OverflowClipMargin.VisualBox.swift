public import W3C_CSS_Shared
public import W3C_CSS_Values


extension OverflowClipMargin {
    public enum VisualBox: String, Sendable, Hashable {

        case contentBox = "content-box"

        case paddingBox = "padding-box"

        case borderBox = "border-box"
    }
}
