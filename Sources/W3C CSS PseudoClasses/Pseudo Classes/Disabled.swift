/// Represents the CSS `:disabled` pseudo-class.
///
/// The `:disabled` pseudo-class matches any disabled element.
/// An element is disabled if it cannot be activated (selected, clicked on, typed into, etc.) or accept focus.
///
/// Example:
/// ```css
/// input:disabled {
///     background-color: #ccc;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :disabled](https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled)
public struct Disabled: CSSPseudoClass {
    public init() {}
}

extension Disabled {
    public var description: String { ":disabled" }
}
