public struct TargetWithin: CSSPseudoClass {
    public init() {}
}

extension TargetWithin {
    public var description: String { ":target-within" }
}
