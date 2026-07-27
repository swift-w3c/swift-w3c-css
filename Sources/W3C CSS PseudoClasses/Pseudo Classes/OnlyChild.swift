/// Represents the CSS `:only-child` pseudo-class.
///
/// The `:only-child` pseudo-class matches an element that has no siblings.
/// This is the same as `:first-child:last-child` or `:nth-child(1):nth-last-child(1)`, but with lower specificity.
///
/// Example:
/// ```css
/// p:only-child {
///     margin: 0;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :only-child](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-child)
public struct OnlyChild: CSSPseudoClass {
    public init() {}
}

extension OnlyChild {
    public var description: String { ":only-child" }
}
