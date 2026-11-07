
extension TextEdge {
    public enum UnderValue: String, Sendable, Hashable, CaseIterable {

        case text

        case ideographic

        case ideographicInk = "ideographic-ink"

        case alphabetic
    }
}
