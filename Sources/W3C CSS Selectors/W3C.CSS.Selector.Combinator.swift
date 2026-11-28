public import W3C_CSS_Shared

extension W3C.CSS.Selector {
    /// Selectors Level 4, section 15.
    public enum Combinator: Sendable, Hashable {
        case descendant
        case child
        case next
        case subsequent
        case column
    }
}

extension W3C.CSS.Selector.Combinator: CustomStringConvertible {
    public var description: String {
        switch self {
        case .descendant: " "
        case .child: ">"
        case .next: "+"
        case .subsequent: "~"
        case .column: "||"
        }
    }
}
