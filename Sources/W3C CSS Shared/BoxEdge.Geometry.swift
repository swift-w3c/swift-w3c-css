
extension BoxEdge {
    public enum Geometry: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case marginBox = "margin-box"
        case fillBox = "fill-box"
        case strokeBox = "stroke-box"
        case viewBox = "view-box"
    }
}
