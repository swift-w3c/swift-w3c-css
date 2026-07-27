/// Represents the CSS `:optional` pseudo-class.
///
/// The `:optional` pseudo-class matches form elements that do not have the required attribute set.
///
/// Example:
/// ```css
/// input:optional {
///     border-color: gray;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :optional](https://developer.mozilla.org/en-US/docs/Web/CSS/:optional)
public struct Optional: CSSPseudoClass {
    public init() {}
}

extension Optional {
    public var description: String { ":optional" }
}
