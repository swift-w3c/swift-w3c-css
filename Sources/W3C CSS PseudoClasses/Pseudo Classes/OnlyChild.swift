public struct OnlyChild: CSSPseudoClass {
    public init() {}
}

extension OnlyChild {
    public var description: String { ":only-child" }
}
