public import W3C_CSS_Shared

extension W3C.CSS {
    /// A custom property, typed by the value it holds (CSS Custom Properties for Cascading Variables Level 1).
    public struct Variable<Value: Sendable>: Sendable, Hashable {
        /// The name without its leading two dashes.
        public let name: String

        public init(_ name: String) {
            self.name = name
        }
    }
}

extension W3C.CSS.Variable: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
}

extension W3C.CSS.Variable: CustomStringConvertible {
    /// The `var()` reference to this custom property.
    public var description: String {
        "var(--" + name + ")"
    }
}

extension W3C.CSS.Variable where Value: CustomStringConvertible {
    /// The declaration that sets this custom property.
    public func callAsFunction(_ value: Value) -> Declaration {
        Declaration(property: "--" + name, value: value.description)
    }
}
