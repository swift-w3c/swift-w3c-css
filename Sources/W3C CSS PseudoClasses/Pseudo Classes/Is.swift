public struct Is: CSSPseudoClass {
    public let description: String

    public init(_ selectors: String) {
        self.description = ":is(\(selectors))"
    }
}
