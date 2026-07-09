/// Represents the CSS `:invalid` pseudo-class.
///
/// The `:invalid` pseudo-class matches form elements whose contents fail to validate.
///
/// Example:
/// ```css
/// input:invalid {
///     border-color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :invalid](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid)
public struct Invalid: CSSPseudoClass {
    public init() {}
}

extension Invalid {
    public var description: String { ":invalid" }
}
