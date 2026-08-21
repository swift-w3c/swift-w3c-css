public struct Has: CSSPseudoClass {
    public let description: String

    public init(_ selector: String) {
        self.description = ":has(\(selector))"
    }
}
