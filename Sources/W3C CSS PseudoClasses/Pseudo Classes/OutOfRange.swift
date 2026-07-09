/// Represents the CSS `:out-of-range` pseudo-class.
///
/// The `:out-of-range` pseudo-class matches input elements whose current value is outside the range limits specified by the min and max attributes.
///
/// Example:
/// ```css
/// input:out-of-range {
///     border-color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :out-of-range](https://developer.mozilla.org/en-US/docs/Web/CSS/:out-of-range)
public struct OutOfRange: CSSPseudoClass {
    public init() {}
}

extension OutOfRange {
    public var description: String { ":out-of-range" }
}
