/// Represents the CSS `:not()` pseudo-class.
///
/// The `:not()` pseudo-class matches elements that do not match the given selector.
/// It takes a selector list as an argument and represents elements not represented by that list.
///
/// Example:
/// ```css
/// p:not(.special) {
///     color: gray;
/// }
/// input:not([type="submit"]) {
///     border: 1px solid;
/// }
/// ```
///
/// - Note: The :not() pseudo-class cannot be nested. Multiple :not() selectors can be chained.
///
/// - SeeAlso: [MDN Web Docs on :not](https://developer.mozilla.org/en-US/docs/Web/CSS/:not)
public struct Not: CSSPseudoClass {
    public let description: String

    /// Creates a `:not()` pseudo-class with the given selector.
    /// - Parameter selector: The selector to negate.
    public init(_ selector: String) {
        self.description = ":not(\(selector))"
    }
}
