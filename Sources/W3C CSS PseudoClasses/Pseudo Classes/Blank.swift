/// Represents the CSS `:blank` pseudo-class.
///
/// The `:blank` pseudo-class matches empty user input elements, such as `<input>` or `<textarea>`.
///
/// Example:
/// ```css
/// input:blank {
///     border-color: red;
/// }
/// ```
///
/// - Note: This is an experimental feature and browser support may be limited.
///
/// - SeeAlso: [MDN Web Docs on :blank](https://developer.mozilla.org/en-US/docs/Web/CSS/:blank)
public struct Blank: CSSPseudoClass {
    public init() {}
}

extension Blank {
    public var description: String { ":blank" }
}
