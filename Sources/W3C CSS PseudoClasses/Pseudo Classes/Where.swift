public struct Where: CSSPseudoClass {
    public let description: String

    public init(_ selectors: String) {
        self.description = ":where(\(selectors))"
    }
}
