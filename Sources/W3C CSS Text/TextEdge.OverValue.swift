
extension TextEdge {
    public enum OverValue: String, Sendable, Hashable, CaseIterable {

        case text

        case ideographic

        case ideographicInk = "ideographic-ink"

        case cap

        case ex
    }
}
