/// Represents the CSS `:first-child` pseudo-class.
///
/// The `:first-child` pseudo-class matches an element that is the first child of its parent.
///
/// Example:
/// ```css
/// li:first-child {
///     font-weight: bold;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :first-child](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-child)
public struct FirstChild: CSSPseudoClass {
    public init() {}
}

extension FirstChild {
    public var description: String { ":first-child" }
}
