public struct ReadOnly: CSSPseudoClass {
    public init() {}
}

extension ReadOnly {
    public var description: String { ":read-only" }
}
