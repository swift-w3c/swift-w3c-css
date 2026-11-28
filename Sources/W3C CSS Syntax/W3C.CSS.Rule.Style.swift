public import W3C_CSS_Selectors
public import W3C_CSS_Shared

extension W3C.CSS.Rule {
    /// A style rule: a selector list and the declarations it applies, in the order written.
    public struct Style: Sendable, Hashable {
        public var selectors: W3C.CSS.Selector.List
        public var declarations: [Declaration]

        public init(_ selectors: W3C.CSS.Selector.List, _ declarations: [Declaration]) {
            self.selectors = selectors
            self.declarations = declarations
        }
    }
}

extension W3C.CSS.Rule.Style: CustomStringConvertible {
    public var description: String {
        selectors.description + "{" + String(block: declarations) + "}"
    }
}
