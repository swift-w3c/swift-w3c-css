/// Represents the CSS `:read-only` pseudo-class.
///
/// The `:read-only` pseudo-class matches elements that are not editable by the user.
///
/// Example:
/// ```css
/// input:read-only {
///     background-color: #f0f0f0;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :read-only](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-only)
public struct ReadOnly: CSSPseudoClass {
    public init() {}
}

extension ReadOnly {
    public var description: String { ":read-only" }
}
