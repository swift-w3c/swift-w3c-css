/// Represents the CSS `:link` pseudo-class.
///
/// The `:link` pseudo-class matches links that have not yet been visited.
/// It will match every unvisited `<a>` or `<area>` element that has an `href` attribute.
///
/// Example:
/// ```css
/// a:link {
///     color: blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :link](https://developer.mozilla.org/en-US/docs/Web/CSS/:link)
public struct Link: CSSPseudoClass {
    public init() {}
}

extension Link {
    public var description: String { ":link" }
}
