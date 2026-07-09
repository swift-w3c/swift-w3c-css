/// Represents the CSS `:placeholder-shown` pseudo-class.
///
/// The `:placeholder-shown` pseudo-class matches input or textarea elements that are currently displaying placeholder text.
///
/// Example:
/// ```css
/// input:placeholder-shown {
///     border-color: gray;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :placeholder-shown](https://developer.mozilla.org/en-US/docs/Web/CSS/:placeholder-shown)
public struct PlaceholderShown: CSSPseudoClass {
    public init() {}
}

extension PlaceholderShown {
    public var description: String { ":placeholder-shown" }
}
