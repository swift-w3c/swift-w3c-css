public struct FirstChild: CSSPseudoClass {
    public init() {}
}

extension FirstChild {
    public var description: String { ":first-child" }
}
