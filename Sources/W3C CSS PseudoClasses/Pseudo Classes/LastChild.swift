public struct LastChild: CSSPseudoClass {
    public init() {}
}

extension LastChild {
    public var description: String { ":last-child" }
}
