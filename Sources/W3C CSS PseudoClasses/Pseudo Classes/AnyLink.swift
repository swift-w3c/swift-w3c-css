/// Represents the CSS `:any-link` pseudo-class.
///
/// The `:any-link` pseudo-class matches every `<a>` or `<area>` element that has an href attribute, independent of whether it has been visited or not.
/// It matches both :link and :visited.
///
/// Example:
/// ```css
/// a:any-link {
///     text-decoration: underline;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :any-link](https://developer.mozilla.org/en-US/docs/Web/CSS/:any-link)
public struct AnyLink: CSSPseudoClass {
    public init() {}
}

extension AnyLink {
    public var description: String { ":any-link" }
}
