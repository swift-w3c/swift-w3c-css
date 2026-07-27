/// Represents the CSS `:empty` pseudo-class.
///
/// The `:empty` pseudo-class matches elements that have no children.
/// This includes text nodes (including whitespace), but comments are ignored.
///
/// Example:
/// ```css
/// div:empty {
///     display: none;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :empty](https://developer.mozilla.org/en-US/docs/Web/CSS/:empty)
public struct Empty: CSSPseudoClass {
    public init() {}
}

extension Empty {
    public var description: String { ":empty" }
}
