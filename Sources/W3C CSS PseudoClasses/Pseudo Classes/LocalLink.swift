/// Represents the CSS `:local-link` pseudo-class.
///
/// The `:local-link` pseudo-class matches links to the same document.
///
/// Example:
/// ```css
/// a:local-link {
///     color: green;
/// }
/// ```
///
/// - Note: This is an experimental feature with limited browser support.
///
/// - SeeAlso: [MDN Web Docs on :local-link](https://developer.mozilla.org/en-US/docs/Web/CSS/:local-link)
public struct LocalLink: CSSPseudoClass {
    public init() {}
}

extension LocalLink {
    public var description: String { ":local-link" }
}
