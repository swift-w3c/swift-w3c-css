/// Represents the CSS `:valid` pseudo-class.
///
/// The `:valid` pseudo-class matches form elements whose contents validate successfully according to their input type.
///
/// Example:
/// ```css
/// input:valid {
///     border-color: green;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :valid](https://developer.mozilla.org/en-US/docs/Web/CSS/:valid)
public struct Valid: CSSPseudoClass {
    public init() {}
}

extension Valid {
    public var description: String { ":valid" }
}
