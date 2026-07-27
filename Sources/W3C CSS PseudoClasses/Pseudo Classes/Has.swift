/// Represents the CSS `:has()` pseudo-class.
///
/// The `:has()` pseudo-class matches elements that have at least one element matching the given selector in their descendants.
/// This is also known as the "parent selector" or "relational selector".
///
/// Example:
/// ```css
/// article:has(img) {
///     border: 1px solid blue;
/// }
/// div:has(> .child) {
///     background-color: yellow;
/// }
/// ```
///
/// - Note: This is a relatively new pseudo-class with growing browser support.
///
/// - SeeAlso: [MDN Web Docs on :has](https://developer.mozilla.org/en-US/docs/Web/CSS/:has)
public struct Has: CSSPseudoClass {
    public let description: String

    /// Creates a `:has()` pseudo-class with the given selector.
    /// - Parameter selector: The selector to check for in descendants.
    public init(_ selector: String) {
        self.description = ":has(\(selector))"
    }
}
