extension BoxEdge {
    public enum Layout: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case marginBox = "margin-box"
    }
}
