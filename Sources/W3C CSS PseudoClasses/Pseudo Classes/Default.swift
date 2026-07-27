/// Represents the CSS `:default` pseudo-class.
///
/// The `:default` pseudo-class matches form elements that are the default among a group of related elements.
/// This includes default buttons, radio buttons, and checkboxes.
///
/// Example:
/// ```css
/// input:default {
///     border-color: blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :default](https://developer.mozilla.org/en-US/docs/Web/CSS/:default)
public struct Default: CSSPseudoClass {
    public init() {}
}

extension Default {
    public var description: String { ":default" }
}
