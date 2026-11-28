public import W3C_CSS_Shared

extension W3C.CSS.Selector {
    /// A selector list: complex selectors separated by commas.
    public struct List: Sendable, Hashable {
        public var selectors: [W3C.CSS.Selector]

        public init(_ selectors: [W3C.CSS.Selector]) {
            self.selectors = selectors
        }
    }
}

extension W3C.CSS.Selector.List: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: W3C.CSS.Selector...) {
        self.init(elements)
    }
}

extension W3C.CSS.Selector.List: CustomStringConvertible {
    public var description: String {
        selectors.map(\.description).joined(separator: ",")
    }
}
