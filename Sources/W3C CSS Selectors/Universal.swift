public import W3C_CSS_Shared

/// Represents the CSS universal selector (*).
///
/// The universal selector matches any element type. It can be used to select all elements
/// or as part of more complex selectors.
///
/// Example:
/// ```swift
/// UniversalSelector()                    // *
/// UniversalSelector.universal            // *
/// ```
///
/// - SeeAlso: [MDN Web Docs on Universal Selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors)
public struct UniversalSelector: Sendable, Hashable {
    /// Creates a universal selector
    public init() {}

    /// A static convenience property for the universal selector
    public static let universal = UniversalSelector()
}

/// Provides string conversion for CSS output
extension UniversalSelector: CustomStringConvertible {
    /// Converts the universal selector to its CSS string representation
    public var description: String {
        return "*"
    }
}
