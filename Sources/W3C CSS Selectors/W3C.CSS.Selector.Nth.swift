public import W3C_CSS_Shared

extension W3C.CSS.Selector {
    /// The An+B notation (CSS Syntax Level 3, section 6).
    public struct Nth: Sendable, Hashable {
        public var step: Int
        public var offset: Int

        public init(step: Int = 0, offset: Int) {
            self.step = step
            self.offset = offset
        }
    }
}

extension W3C.CSS.Selector.Nth {
    public static let odd = Self(step: 2, offset: 1)

    public static let even = Self(step: 2, offset: 0)
}

extension W3C.CSS.Selector.Nth: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(offset: value)
    }
}

extension W3C.CSS.Selector.Nth: CustomStringConvertible {
    public var description: String {
        if step == 0 { return "\(offset)" }
        let head = step == 1 ? "n" : step == -1 ? "-n" : "\(step)n"
        return offset == 0 ? head : offset > 0 ? "\(head)+\(offset)" : "\(head)\(offset)"
    }
}
