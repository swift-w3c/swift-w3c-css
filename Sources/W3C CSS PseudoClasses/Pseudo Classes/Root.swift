/// Represents the CSS `:root` pseudo-class.
///
/// The `:root` pseudo-class matches the root element of the document.
/// In HTML, this is always the `<html>` element. It is commonly used to declare CSS custom properties (variables).
///
/// Example:
/// ```css
/// :root {
///     --main-color: blue;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :root](https://developer.mozilla.org/en-US/docs/Web/CSS/:root)
public struct Root: CSSPseudoClass {
    public init() {}
}

extension Root {
    public var description: String { ":root" }
}
