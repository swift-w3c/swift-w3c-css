public import W3C_CSS_Shared

extension W3C.CSS.Variable {
    /// A custom property set to a value: a property whose name is the variable's.
    public struct Assignment: Sendable, Hashable {

        public let variable: W3C.CSS.Variable<Value>

        /// The value as it is written in the declaration.
        public let description: String

        public init(_ variable: W3C.CSS.Variable<Value>, description: String) {
            self.variable = variable
            self.description = description
        }
    }
}

extension W3C.CSS.Variable.Assignment: Property {

    /// A custom property has no fixed name; the declaration takes it from the variable.
    public static var property: String { "--" }

    public var declaration: Declaration {
        Declaration(property: "--" + variable.name, value: description)
    }

    public static func global(_ global: Global) -> Self {
        Self(W3C.CSS.Variable(""), description: global.rawValue)
    }
}

extension W3C.CSS.Variable where Value: CustomStringConvertible {
    /// This custom property set to `value`, as a property a rule can hold.
    public func assignment(_ value: Value) -> Assignment {
        Assignment(self, description: value.description)
    }
}
