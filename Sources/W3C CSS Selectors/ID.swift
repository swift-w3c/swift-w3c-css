import W3C_CSS_Shared

/// Represents a CSS ID selector.
///
/// ID selectors match elements by their ID attribute. The selector is prefixed
/// with a hash (#) in CSS notation. IDs should be unique within a document.
///
/// Example:
/// ```swift
/// IDSelector("header")                   // #header
/// IDSelector("#main-content")            // #main-content
/// IDSelector("footer")                   // #footer
/// ```
///
/// - SeeAlso: [MDN Web Docs on ID Selector](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors)
public struct IDSelector: Sendable, Hashable {
    /// The ID (without the hash prefix)
    private let id: String

    /// Creates an ID selector for the specified ID
    ///
    /// - Parameter id: The ID (with or without the hash prefix)
    public init(_ id: String) {
        // Remove hash prefix if present, will be added in description
        self.id = id.hasPrefix("#") ? String(id.dropFirst()) : id
    }
}

/// Provides string conversion for CSS output
extension IDSelector: CustomStringConvertible {
    /// Converts the ID selector to its CSS string representation
    public var description: String {
        return "#\(id)"
    }
}
