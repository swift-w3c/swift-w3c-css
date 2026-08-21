public struct Optional: CSSPseudoClass {
    public init() {}
}

extension Optional {
    public var description: String { ":optional" }
}
