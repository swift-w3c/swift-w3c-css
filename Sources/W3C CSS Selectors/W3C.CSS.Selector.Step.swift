public import W3C_CSS_Shared

extension W3C.CSS.Selector {
    /// A combinator and the compound selector it leads to.
    public struct Step: Sendable, Hashable {
        public var combinator: Combinator
        public var compound: Compound

        public init(_ combinator: Combinator, _ compound: Compound) {
            self.combinator = combinator
            self.compound = compound
        }
    }
}
