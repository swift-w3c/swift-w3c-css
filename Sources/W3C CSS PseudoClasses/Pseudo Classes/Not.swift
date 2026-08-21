public struct Not: CSSPseudoClass {
    public let description: String

    public init(_ selector: String) {
        self.description = ":not(\(selector))"
    }
}
