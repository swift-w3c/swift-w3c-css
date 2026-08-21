public struct Empty: CSSPseudoClass {
    public init() {}
}

extension Empty {
    public var description: String { ":empty" }
}
