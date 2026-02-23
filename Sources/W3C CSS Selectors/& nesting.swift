public import W3C_CSS_Shared

/// Represents the CSS nesting selector (&).
///
/// The nesting selector represents the parent selector in nested CSS rules.
/// It allows you to reference the parent selector when writing nested styles.
///
/// Example:
/// ```swift
/// NestingSelector()                      // &
/// NestingSelector.nesting                // &
/// ```
///
/// - SeeAlso: [MDN Web Docs on Nesting Selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Nesting_selector)
public struct NestingSelector: Sendable, Hashable {
    /// Creates a nesting selector
    public init() {}

    /// A static convenience property for the nesting selector
    public static let nesting = NestingSelector()
}

/// Provides string conversion for CSS output
extension NestingSelector: CustomStringConvertible {
    /// Converts the nesting selector to its CSS string representation
    public var description: String {
        return "&"
    }
}
