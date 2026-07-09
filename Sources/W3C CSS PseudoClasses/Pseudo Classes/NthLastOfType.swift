/// Represents the CSS `:nth-last-of-type()` pseudo-class.
///
/// The `:nth-last-of-type()` pseudo-class matches elements based on their position among siblings of the same type, counting from the end.
/// It can accept numeric values, keywords (odd/even), or An+B notation formulas.
///
/// Example:
/// ```css
/// p:nth-last-of-type(odd) {
///     background-color: #f2f2f2;
/// }
/// p:nth-last-of-type(2) {
///     color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :nth-last-of-type](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-of-type)
public struct NthLastOfType: CSSPseudoClass {
    public let description: String

    /// Creates an `:nth-last-of-type()` pseudo-class with a numeric position.
    /// - Parameter n: The position of the element among siblings of the same type from the end (1-indexed).
    public init(_ n: Int) {
        self.description = ":nth-last-of-type(\(n))"
    }

    /// Creates an `:nth-last-of-type()` pseudo-class with a formula.
    /// - Parameter formula: An An+B formula as a string (e.g., "2n", "2n+1", "-n+3").
    public init(formula: String) {
        self.description = ":nth-last-of-type(\(formula))"
    }
}

extension NthLastOfType {
    /// Matches odd-numbered elements of the same type from the end (equivalent to `2n+1`).
    public static let odd = NthLastOfType(formula: "odd")

    /// Matches even-numbered elements of the same type from the end (equivalent to `2n`).
    public static let even = NthLastOfType(formula: "even")
}
