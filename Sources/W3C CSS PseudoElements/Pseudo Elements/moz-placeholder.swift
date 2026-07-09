/// Represents the Mozilla-specific ::-moz-placeholder pseudo-element.
///
/// The `MozPlaceholder` pseudo-element represents placeholder text in input fields
/// in Firefox. This is a vendor-specific pseudo-element that has been superseded
/// by the standard ::placeholder pseudo-element.
///
/// Example:
/// ```css
/// input::-moz-placeholder {
///     color: gray;
///     opacity: 0.5;
/// }
/// ```
///
/// The ::-moz-placeholder pseudo-element:
/// - Is specific to Mozilla Firefox
/// - Styles the placeholder text in input and textarea elements
/// - Has been superseded by the standard ::placeholder pseudo-element
/// - Should be used with ::placeholder for cross-browser compatibility
///
/// - Note: Firefox versions 19+ use ::-moz-placeholder (double colon).
///         Earlier versions used :-moz-placeholder (single colon).
///
/// - Note: Prefer using the standard `Placeholder` pseudo-element for new projects.
///         This vendor-specific version is provided for backwards compatibility.
///
/// - SeeAlso: `Placeholder` for the standard pseudo-element
/// - SeeAlso: [MDN Web Docs on ::placeholder](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
public struct MozPlaceholder: CSSPseudoElement {
    public init() {}
}

extension MozPlaceholder {
    @inlinable public static var name: String { "-moz-placeholder" }
}
