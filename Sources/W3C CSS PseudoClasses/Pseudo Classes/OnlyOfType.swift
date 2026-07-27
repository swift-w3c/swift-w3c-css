/// Represents the CSS `:only-of-type` pseudo-class.
///
/// The `:only-of-type` pseudo-class matches an element that has no siblings of the same type.
///
/// Example:
/// ```css
/// p:only-of-type {
///     margin: 0;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :only-of-type](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-of-type)
public struct OnlyOfType: CSSPseudoClass {
    public init() {}
}

extension OnlyOfType {
    public var description: String { ":only-of-type" }
}
