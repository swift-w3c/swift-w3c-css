/// Represents the CSS `:scope` pseudo-class.
///
/// The `:scope` pseudo-class matches elements that are a reference point for selectors to match against.
/// In the context of a stylesheet, it matches the root element. When used with scoped stylesheets or JavaScript APIs like querySelector, it matches the scoping element.
///
/// Example:
/// ```css
/// :scope > p {
///     color: blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :scope](https://developer.mozilla.org/en-US/docs/Web/CSS/:scope)
public struct Scope: CSSPseudoClass {
    public init() {}
}

extension Scope {
    public var description: String { ":scope" }
}
