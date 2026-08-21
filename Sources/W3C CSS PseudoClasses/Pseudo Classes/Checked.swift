public struct Checked: CSSPseudoClass {
    public init() {}
}

extension Checked {
    public var description: String { ":checked" }
}
