/// Represents the CSS `:last-of-type` pseudo-class.
///
/// The `:last-of-type` pseudo-class matches the last element of its type among a group of sibling elements.
///
/// Example:
/// ```css
/// p:last-of-type {
///     margin-bottom: 0;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :last-of-type](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
public struct LastOfType: CSSPseudoClass {
    public init() {}
}

extension LastOfType {
    public var description: String { ":last-of-type" }
}
