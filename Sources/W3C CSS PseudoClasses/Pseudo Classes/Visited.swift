/// Represents the CSS `:visited` pseudo-class.
///
/// The `:visited` pseudo-class matches links that have been visited by the user.
///
/// Example:
/// ```css
/// a:visited {
///     color: purple;
/// }
/// ```
///
/// - Note: For privacy reasons, browsers strictly limit which styles can be applied using this selector.
///
/// - SeeAlso: [MDN Web Docs on :visited](https://developer.mozilla.org/en-US/docs/Web/CSS/:visited)
public struct Visited: CSSPseudoClass {
    public init() {}
}

extension Visited {
    public var description: String { ":visited" }
}
