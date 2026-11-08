extension BoxEdge {
    public enum Coordinate: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case fillBox = "fill-box"
        case strokeBox = "stroke-box"
        case viewBox = "view-box"
    }
}
