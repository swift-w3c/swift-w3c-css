public import W3C_CSS_Shared

extension W3C.CSS.Rule {
    /// An at-rule: its name, its prelude, and its block when it has one.
    public struct At: Sendable, Hashable {
        public var name: String
        public var prelude: String
        public var block: Block?

        public init(_ name: String, _ prelude: String = "", _ block: Block? = nil) {
            self.name = name
            self.prelude = prelude
            self.block = block
        }
    }
}

extension W3C.CSS.Rule.At {
    /// An at-rule whose prelude is a typed at-rule value, holding rules.
    public init<Prelude: AtRule>(_ prelude: Prelude, _ rules: [W3C.CSS.Rule]) where Prelude.RawValue == String {
        let text = prelude.rawValue.dropFirst(Prelude.identifier.count + 1).drop(while: { $0 == " " })
        self.init(Prelude.identifier, String(text), .rules(rules))
    }
}

extension W3C.CSS.Rule.At: CustomStringConvertible {
    public var description: String {
        let head = "@" + name + (prelude.isEmpty ? "" : " " + prelude)
        switch block {
        case nil: return head + ";"
        case .rules(let rules): return head + "{" + rules.reduce(into: "") { $0 += $1.description } + "}"
        case .declarations(let declarations): return head + "{" + String(block: declarations) + "}"
        }
    }
}
