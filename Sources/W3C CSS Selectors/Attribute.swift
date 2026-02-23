public import W3C_CSS_Shared

/// Represents a CSS attribute selector.
///
/// Attribute selectors match elements based on the presence or value of an attribute.
/// They support various matching operators for flexible selection.
///
/// Example:
/// ```swift
/// AttributeSelector(attribute: "disabled")                                    // [disabled]
/// AttributeSelector(attribute: "type", value: "text", operator: .equal)       // [type="text"]
/// AttributeSelector(attribute: "href", value: "https", operator: .startsWith) // [href^="https"]
/// AttributeSelector(attribute: "src", value: ".png", operator: .endsWith)     // [src$=".png"]
/// ```
///
/// - SeeAlso: [MDN Web Docs on Attribute Selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)
public struct AttributeSelector: Sendable, Hashable {
    /// The attribute name
    private let attribute: String

    /// The attribute value (if any)
    private let value: String?

    /// The matching operator (if any)
    private let `operator`: Operator?

    /// Whether the match should be case-insensitive
    private let caseInsensitive: Bool

    /// Creates an attribute existence selector
    ///
    /// - Parameter attribute: The attribute name to match
    public init(attribute: String) {
        self.attribute = attribute
        self.value = nil
        self.operator = nil
        self.caseInsensitive = false
    }

    /// Creates an attribute selector with a value and operator
    ///
    /// - Parameters:
    ///   - attribute: The attribute name to match
    ///   - value: The value to match against
    ///   - operator: The matching operator to use
    ///   - caseInsensitive: Whether the match should be case-insensitive (default: false)
    public init(attribute: String, value: String, operator: Operator, caseInsensitive: Bool = false)
    {
        self.attribute = attribute
        self.value = value
        self.operator = `operator`
        self.caseInsensitive = caseInsensitive
    }

    /// Operators for attribute value matching
    public enum Operator: String, Sendable, Hashable {
        /// Exact match (=)
        case equal = "="

        /// Contains as space-separated word (~=)
        case wordMatch = "~="

        /// Exact match or starts with followed by hyphen (|=)
        case hyphenMatch = "|="

        /// Starts with (^=)
        case startsWith = "^="

        /// Ends with ($=)
        case endsWith = "$="

        /// Contains substring (*=)
        case contains = "*="
    }
}

/// Provides string conversion for CSS output
extension AttributeSelector: CustomStringConvertible {
    /// Converts the attribute selector to its CSS string representation
    public var description: String {
        guard let value = value, let op = `operator` else {
            return "[\(attribute)]"
        }

        let caseFlag = caseInsensitive ? " i" : ""
        return "[\(attribute)\(op.rawValue)\"\(value)\"\(caseFlag)]"
    }
}
