/// Represents the Microsoft-specific ::-ms-input-placeholder pseudo-element.
///
/// The `MsInputPlaceholder` pseudo-element represents placeholder text in input fields
/// in Internet Explorer and older versions of Edge. This is a vendor-specific pseudo-element
/// that has been superseded by the standard ::placeholder pseudo-element.
///
/// Example:
/// ```css
/// input::-ms-input-placeholder {
///     color: gray;
/// }
/// ```
///
/// The ::-ms-input-placeholder pseudo-element:
/// - Is specific to Internet Explorer 10+ and older versions of Microsoft Edge
/// - Styles the placeholder text in input and textarea elements
/// - Has been superseded by the standard ::placeholder pseudo-element
/// - Should be used with ::placeholder for cross-browser compatibility
///
/// - Note: Internet Explorer applies opacity: 0.54 to placeholders by default,
///         while other browsers use opacity: 1. You may need to set opacity
///         explicitly for consistent appearance.
///
/// - Note: Prefer using the standard `Placeholder` pseudo-element for new projects.
///         This vendor-specific version is provided for backwards compatibility.
///
/// - SeeAlso: `Placeholder` for the standard pseudo-element
/// - SeeAlso: [MDN Web Docs on ::placeholder](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
public struct MsInputPlaceholder: CSSPseudoElement {
    public init() {}
}

extension MsInputPlaceholder {
    @inlinable public static var name: String { "-ms-input-placeholder" }
}
