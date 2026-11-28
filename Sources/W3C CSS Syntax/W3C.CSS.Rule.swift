public import W3C_CSS_Selectors
public import W3C_CSS_Shared

extension W3C.CSS {
    /// A rule of a stylesheet (CSS Syntax Level 3, section 5, and section 9 for the style rule).
    public enum Rule: Sendable, Hashable {
        case style(Style)
        case qualified(Qualified)
        case at(At)
    }
}

extension W3C.CSS.Rule {
    public static func style(_ selectors: W3C.CSS.Selector.List, _ declarations: [Declaration]) -> Self {
        .style(.init(selectors, declarations))
    }

    public static func style(_ selector: W3C.CSS.Selector, _ declarations: [Declaration]) -> Self {
        .style(.init([selector], declarations))
    }
}

extension W3C.CSS.Rule: CustomStringConvertible {
    public var description: String {
        switch self {
        case .style(let rule): rule.description
        case .qualified(let rule): rule.description
        case .at(let rule): rule.description
        }
    }
}
