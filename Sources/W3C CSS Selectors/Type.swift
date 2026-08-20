import W3C_CSS_Shared

/// Represents a CSS type selector (element selector).
///
/// Type selectors match elements by their node name. Element names are case-insensitive
/// in HTML but case-sensitive in XML and SVG.
///
/// Example:
/// ```swift
/// TypeSelector("div")                    // div
/// TypeSelector("p")                      // p
/// TypeSelector("DIV")                    // div (converted to lowercase)
/// ```
///
/// - SeeAlso: [MDN Web Docs on Type Selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors)
public struct TypeSelector: Sendable, Hashable {
    /// The element name
    private let element: String

    /// Creates a type selector for the specified element
    ///
    /// - Parameter element: The element name (will be converted to lowercase)
    public init(_ element: String) {
        self.element = element.lowercased()
    }
}

/// Provides string conversion for CSS output
extension TypeSelector: CustomStringConvertible {
    /// Converts the type selector to its CSS string representation
    public var description: String {
        return element
    }
}
