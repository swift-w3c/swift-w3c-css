public struct Lang: CSSPseudoClass {
    public let description: String

    public init(_ languageCode: String) {
        self.description = ":lang(\(languageCode))"
    }
}
