/// Represents the CSS `:where()` pseudo-class.
///
/// The `:where()` pseudo-class takes a selector list as an argument and matches any element that can be matched by one of the selectors in that list.
/// It is functionally identical to `:is()`, but with zero specificity.
///
/// Example:
/// ```css
/// :where(header, main, footer) p {
///     color: blue;
/// }
/// ```
///
/// - Note: Unlike :is(), the specificity of :where() is always zero.
///
/// - SeeAlso: [MDN Web Docs on :where](https://developer.mozilla.org/en-US/docs/Web/CSS/:where)
public struct Where: CSSPseudoClass {
    public let description: String

    /// Creates a `:where()` pseudo-class with the given selector(s).
    /// - Parameter selectors: One or more selectors, can be comma-separated.
    public init(_ selectors: String) {
        self.description = ":where(\(selectors))"
    }
}
