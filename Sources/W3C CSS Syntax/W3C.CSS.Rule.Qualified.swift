public import W3C_CSS_Shared

extension W3C.CSS.Rule {
    /// A qualified rule whose prelude is not a selector list, such as a keyframe inside `@keyframes`.
    public struct Qualified: Sendable, Hashable {
        public var prelude: String
        public var declarations: [Declaration]

        public init(_ prelude: String, _ declarations: [Declaration]) {
            self.prelude = prelude
            self.declarations = declarations
        }
    }
}

extension W3C.CSS.Rule.Qualified: CustomStringConvertible {
    public var description: String {
        prelude + "{" + String(block: declarations) + "}"
    }
}
