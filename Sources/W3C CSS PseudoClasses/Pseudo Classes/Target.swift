/// Represents the CSS `:target` pseudo-class.
///
/// The `:target` pseudo-class matches an element with an id matching the URL's fragment identifier.
///
/// Example:
/// ```css
/// section:target {
///     background-color: yellow;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :target](https://developer.mozilla.org/en-US/docs/Web/CSS/:target)
public struct Target: CSSPseudoClass {
    public init() {}
}

extension Target {
    public var description: String { ":target" }
}
