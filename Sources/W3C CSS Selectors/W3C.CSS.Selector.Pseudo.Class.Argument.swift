public import W3C_CSS_Shared

extension W3C.CSS.Selector.Pseudo.Class {
    /// What a functional pseudo-class takes between its parentheses.
    public enum Argument: Sendable, Hashable {
        case selectors(W3C.CSS.Selector.List)
        case relative([W3C.CSS.Selector.Relative])
        case nth(W3C.CSS.Selector.Nth)
        case identifier(String)
    }
}

extension W3C.CSS.Selector.Pseudo.Class.Argument: CustomStringConvertible {
    public var description: String {
        switch self {
        case .selectors(let list): list.description
        case .relative(let selectors): selectors.map(\.description).joined(separator: ",")
        case .nth(let nth): nth.description
        case .identifier(let name): name
        }
    }
}
