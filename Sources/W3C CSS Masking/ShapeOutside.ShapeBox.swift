public import W3C_CSS_Shared
public import W3C_CSS_Values


extension ShapeOutside {
    public enum ShapeBox: String, Sendable {

        case marginBox = "margin-box"

        case borderBox = "border-box"

        case paddingBox = "padding-box"

        case contentBox = "content-box"
    }
}
