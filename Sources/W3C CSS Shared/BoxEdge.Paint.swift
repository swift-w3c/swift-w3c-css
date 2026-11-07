
extension BoxEdge {
    public enum Paint: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case fillBox = "fill-box"
        case strokeBox = "stroke-box"
    }
}
