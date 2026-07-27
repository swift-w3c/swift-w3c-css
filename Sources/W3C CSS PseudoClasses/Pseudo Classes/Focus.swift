/// Represents the CSS `:focus` pseudo-class.
///
/// The `:focus` pseudo-class matches when an element has received focus.
/// It is generally triggered when the user clicks or taps on an element or selects it with the keyboard's Tab key.
///
/// Example:
/// ```css
/// input:focus {
///     border-color: blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :focus](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus)
public struct Focus: CSSPseudoClass {
    public init() {}
}

extension Focus {
    public var description: String { ":focus" }
}
