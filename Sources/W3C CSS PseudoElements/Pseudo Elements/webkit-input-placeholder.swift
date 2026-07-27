/// Represents the WebKit-specific ::-webkit-input-placeholder pseudo-element.
///
/// The `WebkitInputPlaceholder` pseudo-element represents placeholder text in input fields
/// in WebKit-based browsers (Safari, older versions of Chrome). This is a vendor-specific
/// pseudo-element that has been superseded by the standard ::placeholder pseudo-element.
///
/// Example:
/// ```css
/// input::-webkit-input-placeholder {
///     color: gray;
///     opacity: 0.5;
/// }
/// ```
///
/// The ::-webkit-input-placeholder pseudo-element:
/// - Is specific to WebKit-based browsers
/// - Styles the placeholder text in input and textarea elements
/// - Has been superseded by the standard ::placeholder pseudo-element
/// - Should be used with ::placeholder for cross-browser compatibility
///
/// - Note: Prefer using the standard `Placeholder` pseudo-element for new projects.
///         This vendor-specific version is provided for backwards compatibility.
///
/// - SeeAlso: `Placeholder` for the standard pseudo-element
/// - SeeAlso: [MDN Web Docs on ::placeholder](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
public struct WebkitInputPlaceholder: CSSPseudoElement {
    public init() {}
}

extension WebkitInputPlaceholder {
    @inlinable public static var name: String { "-webkit-input-placeholder" }
}
