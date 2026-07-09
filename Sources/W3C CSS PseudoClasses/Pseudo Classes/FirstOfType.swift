/// Represents the CSS `:first-of-type` pseudo-class.
///
/// The `:first-of-type` pseudo-class matches the first element of its type among a group of sibling elements.
///
/// Example:
/// ```css
/// p:first-of-type {
///     font-size: larger;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :first-of-type](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type)
public struct FirstOfType: CSSPseudoClass {
    public init() {}
}

extension FirstOfType {
    public var description: String { ":first-of-type" }
}
