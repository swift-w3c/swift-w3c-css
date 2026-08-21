public struct Scope: CSSPseudoClass {
    public init() {}
}

extension Scope {
    public var description: String { ":scope" }
}
