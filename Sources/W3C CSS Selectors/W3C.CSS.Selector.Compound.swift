public import W3C_CSS_Shared

extension W3C.CSS.Selector {
    /// A compound selector: simple selectors with no combinator between them.
    public struct Compound: Sendable, Hashable {
        public var parts: [Simple]

        public init(_ parts: [Simple]) {
            self.parts = parts
        }
    }
}

extension W3C.CSS.Selector.Compound: CustomStringConvertible {
    public var description: String {
        parts.reduce(into: "") { $0 += $1.description }
    }
}
