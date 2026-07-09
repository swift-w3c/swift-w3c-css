/// Represents the CSS `:read-write` pseudo-class.
///
/// The `:read-write` pseudo-class matches elements that are editable by the user, such as text input elements.
///
/// Example:
/// ```css
/// input:read-write {
///     border-color: blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :read-write](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-write)
public struct ReadWrite: CSSPseudoClass {
    public init() {}
}

extension ReadWrite {
    public var description: String { ":read-write" }
}
