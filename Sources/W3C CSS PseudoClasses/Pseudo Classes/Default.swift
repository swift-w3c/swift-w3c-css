public struct Default: CSSPseudoClass {
    public init() {}
}

extension Default {
    public var description: String { ":default" }
}
