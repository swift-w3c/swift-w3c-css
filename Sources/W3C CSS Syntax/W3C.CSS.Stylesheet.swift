public import W3C_CSS_Shared

extension W3C.CSS {
    /// A stylesheet: rules in the order they are written, which is the order the cascade reads them in.
    public struct Stylesheet: Sendable, Hashable {
        public var rules: [Rule]

        public init(_ rules: [Rule] = []) {
            self.rules = rules
        }
    }
}

extension W3C.CSS.Stylesheet: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: W3C.CSS.Rule...) {
        self.init(elements)
    }
}

extension W3C.CSS.Stylesheet: CustomStringConvertible {
    public var description: String {
        rules.reduce(into: "") { $0 += $1.description }
    }
}
