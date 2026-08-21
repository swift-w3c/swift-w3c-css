public struct Placeholder: CSSPseudoElement {
    public init() {}
}

extension Placeholder {
    @inlinable public static var name: String { "placeholder" }
}
