/// Represents the CSS `:required` pseudo-class.
///
/// The `:required` pseudo-class matches form elements that have the required attribute set.
///
/// Example:
/// ```css
/// input:required {
///     border-color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :required](https://developer.mozilla.org/en-US/docs/Web/CSS/:required)
public struct Required: CSSPseudoClass {
    public init() {}
}

extension Required {
    public var description: String { ":required" }
}
