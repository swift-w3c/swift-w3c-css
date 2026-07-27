/// Represents the CSS `:focus-within` pseudo-class.
///
/// The `:focus-within` pseudo-class matches an element if the element or any of its descendants are focused.
///
/// Example:
/// ```css
/// form:focus-within {
///     background-color: lightyellow;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :focus-within](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus-within)
public struct FocusWithin: CSSPseudoClass {
    public init() {}
}

extension FocusWithin {
    public var description: String { ":focus-within" }
}
