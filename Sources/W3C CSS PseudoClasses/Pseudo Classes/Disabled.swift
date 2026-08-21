public struct Disabled: CSSPseudoClass {
    public init() {}
}

extension Disabled {
    public var description: String { ":disabled" }
}
