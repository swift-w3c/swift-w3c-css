/// Represents the CSS `:nth-of-type()` pseudo-class.
///
/// The `:nth-of-type()` pseudo-class matches elements based on their position among siblings of the same type.
/// It can accept numeric values, keywords (odd/even), or An+B notation formulas.
///
/// Example:
/// ```css
/// p:nth-of-type(odd) {
///     background-color: #f2f2f2;
/// }
/// p:nth-of-type(2) {
///     color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :nth-of-type](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-of-type)
public struct NthOfType: CSSPseudoClass {
    public let description: String

    /// Creates an `:nth-of-type()` pseudo-class with a numeric position.
    /// - Parameter n: The position of the element among siblings of the same type (1-indexed).
    public init(_ n: Int) {
        self.description = ":nth-of-type(\(n))"
    }

    /// Creates an `:nth-of-type()` pseudo-class with a formula.
    /// - Parameter formula: An An+B formula as a string (e.g., "2n", "2n+1", "-n+3").
    public init(formula: String) {
        self.description = ":nth-of-type(\(formula))"
    }
}

extension NthOfType {
    /// Matches odd-numbered elements of the same type (equivalent to `2n+1`).
    public static let odd = NthOfType(formula: "odd")

    /// Matches even-numbered elements of the same type (equivalent to `2n`).
    public static let even = NthOfType(formula: "even")
}
