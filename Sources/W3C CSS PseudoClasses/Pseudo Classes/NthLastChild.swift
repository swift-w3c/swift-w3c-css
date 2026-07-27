/// Represents the CSS `:nth-last-child()` pseudo-class.
///
/// The `:nth-last-child()` pseudo-class matches elements based on their position among siblings, counting from the end.
/// It can accept numeric values, keywords (odd/even), or An+B notation formulas.
///
/// Example:
/// ```css
/// tr:nth-last-child(odd) {
///     background-color: #f2f2f2;
/// }
/// li:nth-last-child(2) {
///     color: red;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :nth-last-child](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-child)
public struct NthLastChild: CSSPseudoClass {
    public let description: String

    /// Creates an `:nth-last-child()` pseudo-class with a numeric position.
    /// - Parameter n: The position of the child from the end (1-indexed).
    public init(_ n: Int) {
        self.description = ":nth-last-child(\(n))"
    }

    /// Creates an `:nth-last-child()` pseudo-class with a formula.
    /// - Parameter formula: An An+B formula as a string (e.g., "2n", "2n+1", "-n+3").
    public init(formula: String) {
        self.description = ":nth-last-child(\(formula))"
    }
}

extension NthLastChild {
    /// Matches odd-numbered children from the end (equivalent to `2n+1`).
    public static let odd = NthLastChild(formula: "odd")

    /// Matches even-numbered children from the end (equivalent to `2n`).
    public static let even = NthLastChild(formula: "even")
}
