
extension TextEdge {
    public enum Value: String, Sendable, Hashable, CaseIterable {

        case text

        case ideographic

        case ideographicInk = "ideographic-ink"
    }
}
