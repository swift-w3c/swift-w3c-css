public import W3C_CSS_Shared

extension W3C.CSS.Selector {
    /// A relative selector: a complex selector that may begin with a combinator (Selectors Level 4, section 3.5).
    public struct Relative: Sendable, Hashable {
        public var combinator: Combinator?
        public var selector: W3C.CSS.Selector

        public init(_ combinator: Combinator? = nil, _ selector: W3C.CSS.Selector) {
            self.combinator = combinator
            self.selector = selector
        }
    }
}

extension W3C.CSS.Selector.Relative {
    public static func descendant(_ selector: W3C.CSS.Selector) -> Self { Self(nil, selector) }

    public static func child(_ selector: W3C.CSS.Selector) -> Self { Self(.child, selector) }

    public static func next(_ selector: W3C.CSS.Selector) -> Self { Self(.next, selector) }

    public static func subsequent(_ selector: W3C.CSS.Selector) -> Self { Self(.subsequent, selector) }
}

extension W3C.CSS.Selector.Relative: CustomStringConvertible {
    public var description: String {
        (combinator.map { $0 == .descendant ? "" : $0.description } ?? "") + selector.description
    }
}
