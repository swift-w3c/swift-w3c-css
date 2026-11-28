public import W3C_CSS_Shared

extension W3C.CSS.Selector.Pseudo {
    /// A pseudo-element: a name, and for a functional pseudo-element its argument.
    public struct Element: Sendable, Hashable {
        public var name: String
        public var argument: String?

        public init(_ name: String, _ argument: String? = nil) {
            self.name = name
            self.argument = argument
        }
    }
}

extension W3C.CSS.Selector.Pseudo.Element: CustomStringConvertible {
    public var description: String {
        guard let argument else { return "::" + name }
        return "::" + name + "(" + argument + ")"
    }
}
