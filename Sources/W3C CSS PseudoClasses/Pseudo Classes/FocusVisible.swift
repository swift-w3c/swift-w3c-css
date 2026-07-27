/// Represents the CSS `:focus-visible` pseudo-class.
///
/// The `:focus-visible` pseudo-class matches an element that has received focus and the user agent determines that focus should be visibly indicated.
/// This is useful for differentiating between mouse and keyboard focus.
///
/// Example:
/// ```css
/// button:focus-visible {
///     outline: 2px solid blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :focus-visible](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus-visible)
public struct FocusVisible: CSSPseudoClass {
    public init() {}
}

extension FocusVisible {
    public var description: String { ":focus-visible" }
}
