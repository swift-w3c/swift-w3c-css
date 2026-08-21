public struct Target: CSSPseudoClass {
    public init() {}
}

extension Target {
    public var description: String { ":target" }
}
