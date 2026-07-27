/// Represents the CSS `:active` pseudo-class.
///
/// The `:active` pseudo-class matches when an element is being activated by the user.
/// For example, when using a mouse, it typically matches from the time the user presses the mouse button until they release it.
///
/// Example:
/// ```css
/// a:active {
///     color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :active](https://developer.mozilla.org/en-US/docs/Web/CSS/:active)
public struct Active: CSSPseudoClass {
    public init() {}
}

extension Active {
    public var description: String { ":active" }
}
