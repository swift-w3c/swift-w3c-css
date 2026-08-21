public struct Enabled: CSSPseudoClass {
    public init() {}
}

extension Enabled {
    public var description: String { ":enabled" }
}
