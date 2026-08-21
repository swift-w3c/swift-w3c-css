public struct Required: CSSPseudoClass {
    public init() {}
}

extension Required {
    public var description: String { ":required" }
}
