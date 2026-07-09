/// Represents the CSS `:checked` pseudo-class.
///
/// The `:checked` pseudo-class matches radio, checkbox, or option elements that are checked or toggled to an on state.
///
/// Example:
/// ```css
/// input:checked {
///     border-color: blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :checked](https://developer.mozilla.org/en-US/docs/Web/CSS/:checked)
public struct Checked: CSSPseudoClass {
    public init() {}
}

extension Checked {
    public var description: String { ":checked" }
}
