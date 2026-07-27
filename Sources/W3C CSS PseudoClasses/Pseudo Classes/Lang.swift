/// Represents the CSS `:lang()` pseudo-class.
///
/// The `:lang()` pseudo-class matches elements based on the language they are determined to be in.
/// The language is determined by the `lang` attribute, `<meta>` elements, or HTTP headers.
///
/// Example:
/// ```css
/// p:lang(en) {
///     quotes: '"' '"';
/// }
/// p:lang(fr) {
///     quotes: '«' '»';
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :lang](https://developer.mozilla.org/en-US/docs/Web/CSS/:lang)
public struct Lang: CSSPseudoClass {
    public let description: String

    /// Creates a `:lang()` pseudo-class with the given language code.
    /// - Parameter languageCode: The language code (e.g., "en", "fr", "en-US").
    public init(_ languageCode: String) {
        self.description = ":lang(\(languageCode))"
    }
}
