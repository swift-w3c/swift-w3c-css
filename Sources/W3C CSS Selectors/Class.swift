import W3C_CSS_Shared

/// Represents a CSS class selector.
///
/// Class selectors match elements by their class attribute. The selector is prefixed
/// with a dot (.) in CSS notation.
///
/// Example:
/// ```swift
/// ClassSelector("container")             // .container
/// ClassSelector(".nav-item")             // .nav-item
/// ClassSelector("btn-primary")           // .btn-primary
/// ```
///
/// - SeeAlso: [MDN Web Docs on Class Selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors)
public struct ClassSelector: Sendable, Hashable {
    /// The class name (without the dot prefix)
    private let className: String

    /// Creates a class selector for the specified class name
    ///
    /// - Parameter className: The class name (with or without the dot prefix)
    public init(_ className: String) {
        // Remove dot prefix if present, will be added in description
        self.className = className.hasPrefix(".") ? String(className.dropFirst()) : className
    }
}

/// Provides string conversion for CSS output
extension ClassSelector: CustomStringConvertible {
    /// Converts the class selector to its CSS string representation
    public var description: String {
        return ".\(className)"
    }
}
