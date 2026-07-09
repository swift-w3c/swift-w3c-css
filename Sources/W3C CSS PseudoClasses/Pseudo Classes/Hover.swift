/// Represents the CSS `:hover` pseudo-class.
///
/// The `:hover` pseudo-class matches when the user interacts with an element with a pointing device, but does not necessarily activate it.
/// It is generally triggered when the user hovers over an element with the cursor (mouse pointer).
///
/// Example:
/// ```css
/// a:hover {
///     color: orange;
/// }
/// ```
///
/// - Note: On touch screen devices, `:hover` can be problematic because it may never match or only briefly match after tapping an element.
///
/// - SeeAlso: [MDN Web Docs on :hover](https://developer.mozilla.org/en-US/docs/Web/CSS/:hover)
public struct Hover: CSSPseudoClass {
    public init() {}
}

extension Hover {
    public var description: String { ":hover" }
}
