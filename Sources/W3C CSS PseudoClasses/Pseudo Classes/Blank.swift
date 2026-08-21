public struct Blank: CSSPseudoClass {
    public init() {}
}

extension Blank {
    public var description: String { ":blank" }
}
