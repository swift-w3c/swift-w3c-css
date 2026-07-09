/// Represents the CSS `:last-child` pseudo-class.
///
/// The `:last-child` pseudo-class matches an element that is the last child of its parent.
///
/// Example:
/// ```css
/// li:last-child {
///     border-bottom: none;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :last-child](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child)
public struct LastChild: CSSPseudoClass {
    public init() {}
}

extension LastChild {
    public var description: String { ":last-child" }
}
