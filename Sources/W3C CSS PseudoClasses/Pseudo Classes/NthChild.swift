/// Represents the CSS `:nth-child()` pseudo-class.
///
/// The `:nth-child()` pseudo-class matches elements based on their position among siblings.
/// It can accept numeric values, keywords (odd/even), or An+B notation formulas.
///
/// Example:
/// ```css
/// tr:nth-child(odd) {
///     background-color: #f2f2f2;
/// }
/// tr:nth-child(2n+1) {
///     background-color: #f2f2f2;
/// }
/// li:nth-child(3) {
///     color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :nth-child](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-child)
public struct NthChild: CSSPseudoClass {
    public let description: String

    /// Creates an `:nth-child()` pseudo-class with a numeric position.
    /// - Parameter n: The position of the child (1-indexed).
    public init(_ n: Int) {
        self.description = ":nth-child(\(n))"
    }

    /// Creates an `:nth-child()` pseudo-class with a formula.
    /// - Parameter formula: An An+B formula as a string (e.g., "2n", "2n+1", "-n+3").
    public init(formula: String) {
        self.description = ":nth-child(\(formula))"
    }
}

extension NthChild {
    /// Matches odd-numbered children (equivalent to `2n+1`).
    public static let odd = NthChild(formula: "odd")

    /// Matches even-numbered children (equivalent to `2n`).
    public static let even = NthChild(formula: "even")
}
