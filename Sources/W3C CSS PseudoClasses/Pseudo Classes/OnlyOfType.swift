public struct OnlyOfType: CSSPseudoClass {
    public init() {}
}

extension OnlyOfType {
    public var description: String { ":only-of-type" }
}
