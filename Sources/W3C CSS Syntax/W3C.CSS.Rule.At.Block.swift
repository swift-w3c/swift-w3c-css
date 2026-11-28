public import W3C_CSS_Shared

extension W3C.CSS.Rule.At {
    /// What an at-rule's block holds.
    public enum Block: Sendable, Hashable {
        case rules([W3C.CSS.Rule])
        case declarations([Declaration])
    }
}
