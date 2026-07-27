/// Represents the CSS `:indeterminate` pseudo-class.
///
/// The `:indeterminate` pseudo-class matches form elements whose state is indeterminate.
/// This applies to checkboxes in an indeterminate state, radio buttons in a group where none are selected, and progress elements with no value.
///
/// Example:
/// ```css
/// input:indeterminate {
///     border-color: orange;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :indeterminate](https://developer.mozilla.org/en-US/docs/Web/CSS/:indeterminate)
public struct Indeterminate: CSSPseudoClass {
    public init() {}
}

extension Indeterminate {
    public var description: String { ":indeterminate" }
}
