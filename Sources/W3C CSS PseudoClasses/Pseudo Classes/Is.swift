/// Represents the CSS `:is()` pseudo-class.
///
/// The `:is()` pseudo-class takes a selector list as an argument and matches any element that can be matched by one of the selectors in that list.
/// This is useful for writing large selectors in a more compact form.
///
/// Example:
/// ```css
/// :is(header, main, footer) p:hover {
///     color: red;
/// }
/// ```
///
/// - Note: The specificity of :is() is the specificity of the most specific selector in its argument list.
///
/// - SeeAlso: [MDN Web Docs on :is](https://developer.mozilla.org/en-US/docs/Web/CSS/:is)
public struct Is: CSSPseudoClass {
    public let description: String

    /// Creates an `:is()` pseudo-class with the given selector(s).
    /// - Parameter selectors: One or more selectors, can be comma-separated.
    public init(_ selectors: String) {
        self.description = ":is(\(selectors))"
    }
}
