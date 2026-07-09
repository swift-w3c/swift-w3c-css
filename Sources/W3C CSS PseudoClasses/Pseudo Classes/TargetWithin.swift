/// Represents the CSS `:target-within` pseudo-class.
///
/// The `:target-within` pseudo-class matches an element if it is the target element or contains an element that is the target.
///
/// Example:
/// ```css
/// article:target-within {
///     background-color: lightyellow;
/// }
/// ```
///
/// - Note: This is an experimental feature with limited browser support.
///
/// - SeeAlso: [MDN Web Docs on :target-within](https://developer.mozilla.org/en-US/docs/Web/CSS/:target-within)
public struct TargetWithin: CSSPseudoClass {
    public init() {}
}

extension TargetWithin {
    public var description: String { ":target-within" }
}
