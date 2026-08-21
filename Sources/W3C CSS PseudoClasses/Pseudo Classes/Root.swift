public struct Root: CSSPseudoClass {
    public init() {}
}

extension Root {
    public var description: String { ":root" }
}
