public struct Invalid: CSSPseudoClass {
    public init() {}
}

extension Invalid {
    public var description: String { ":invalid" }
}
