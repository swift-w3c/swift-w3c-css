/// Represents the CSS `:in-range` pseudo-class.
///
/// The `:in-range` pseudo-class matches input elements whose current value is within the range limits specified by the min and max attributes.
///
/// Example:
/// ```css
/// input:in-range {
///     border-color: green;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :in-range](https://developer.mozilla.org/en-US/docs/Web/CSS/:in-range)
public struct InRange: CSSPseudoClass {
    public init() {}
}

extension InRange {
    public var description: String { ":in-range" }
}
