public struct ReadWrite: CSSPseudoClass {
    public init() {}
}

extension ReadWrite {
    public var description: String { ":read-write" }
}
