/// Represents the CSS `:dir()` pseudo-class.
///
/// The `:dir()` pseudo-class matches elements based on the directionality of the text they contain.
///
/// Example:
/// ```css
/// p:dir(ltr) {
///     text-align: left;
/// }
/// p:dir(rtl) {
///     text-align: right;
/// }
/// ```
///
/// - SeeAlso: [MDN Web Docs on :dir](https://developer.mozilla.org/en-US/docs/Web/CSS/:dir)
public struct Dir: CSSPseudoClass {
    public let description: String

    /// Creates a `:dir()` pseudo-class with the given direction.
    /// - Parameter direction: The text direction.
    public init(_ direction: Direction) {
        self.description = ":dir(\(direction.rawValue))"
    }
}

extension Dir {
    /// Represents text directionality.
    public enum Direction: String, Sendable, Hashable {
        /// Left-to-right text direction.
        case ltr
        /// Right-to-left text direction.
        case rtl
    }
}
