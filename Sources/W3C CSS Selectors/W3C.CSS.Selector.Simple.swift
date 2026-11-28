public import W3C_CSS_Shared

extension W3C.CSS.Selector {
    /// A simple selector (Selectors Level 4, section 3.1).
    public enum Simple: Sendable, Hashable {
        case universal
        case nesting
        case type(String)
        case `class`(String)
        case id(String)
        case attribute(AttributeSelector)
        case pseudoClass(Pseudo.Class)
        case pseudoElement(Pseudo.Element)
    }
}

extension W3C.CSS.Selector.Simple: CustomStringConvertible {
    public var description: String {
        switch self {
        case .universal: "*"
        case .nesting: "&"
        case .type(let name): name
        case .class(let name): "." + name
        case .id(let name): "#" + name
        case .attribute(let attribute): attribute.description
        case .pseudoClass(let pseudo): pseudo.description
        case .pseudoElement(let pseudo): pseudo.description
        }
    }
}
