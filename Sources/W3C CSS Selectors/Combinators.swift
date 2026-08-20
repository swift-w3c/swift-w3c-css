import W3C_CSS_Shared

/// Represents the CSS descendant combinator (space).
///
/// The descendant combinator selects elements that are descendants of a specified element.
///
/// Example:
/// ```swift
/// DescendantCombinator()                 // " "
/// ```
///
/// - SeeAlso: [MDN Web Docs on Descendant Combinator](https://developer.mozilla.org/en-US/docs/Web/CSS/Descendant_combinator)
public struct DescendantCombinator: Sendable, Hashable {
    /// Creates a descendant combinator
    public init() {}
}

/// Provides string conversion for CSS output
extension DescendantCombinator: CustomStringConvertible {
    /// Converts the descendant combinator to its CSS string representation
    public var description: String {
        return " "
    }
}

/// Represents the CSS child combinator (>).
///
/// The child combinator selects elements that are direct children of a specified element.
///
/// Example:
/// ```swift
/// ChildCombinator()                      // " > "
/// ```
///
/// - SeeAlso: [MDN Web Docs on Child Combinator](https://developer.mozilla.org/en-US/docs/Web/CSS/Child_combinator)
public struct ChildCombinator: Sendable, Hashable {
    /// Creates a child combinator
    public init() {}
}

/// Provides string conversion for CSS output
extension ChildCombinator: CustomStringConvertible {
    /// Converts the child combinator to its CSS string representation
    public var description: String {
        return " > "
    }
}

/// Represents the CSS adjacent sibling combinator (+).
///
/// The adjacent sibling combinator selects an element that is immediately preceded by a specified element.
///
/// Example:
/// ```swift
/// AdjacentSiblingCombinator()            // " + "
/// ```
///
/// - SeeAlso: [MDN Web Docs on Adjacent Sibling Combinator](https://developer.mozilla.org/en-US/docs/Web/CSS/Adjacent_sibling_combinator)
public struct AdjacentSiblingCombinator: Sendable, Hashable {
    /// Creates an adjacent sibling combinator
    public init() {}
}

/// Provides string conversion for CSS output
extension AdjacentSiblingCombinator: CustomStringConvertible {
    /// Converts the adjacent sibling combinator to its CSS string representation
    public var description: String {
        return " + "
    }
}

/// Represents the CSS general sibling combinator (~).
///
/// The general sibling combinator selects all elements that are preceded by a specified element.
///
/// Example:
/// ```swift
/// GeneralSiblingCombinator()             // " ~ "
/// ```
///
/// - SeeAlso: [MDN Web Docs on General Sibling Combinator](https://developer.mozilla.org/en-US/docs/Web/CSS/General_sibling_combinator)
public struct GeneralSiblingCombinator: Sendable, Hashable {
    /// Creates a general sibling combinator
    public init() {}
}

/// Provides string conversion for CSS output
extension GeneralSiblingCombinator: CustomStringConvertible {
    /// Converts the general sibling combinator to its CSS string representation
    public var description: String {
        return " ~ "
    }
}

/// Represents the CSS column combinator (||).
///
/// The column combinator selects elements that belong to a column.
///
/// Example:
/// ```swift
/// ColumnCombinator()                     // " || "
/// ```
///
/// - SeeAlso: [MDN Web Docs on Column Combinator](https://developer.mozilla.org/en-US/docs/Web/CSS/Column_combinator)
public struct ColumnCombinator: Sendable, Hashable {
    /// Creates a column combinator
    public init() {}
}

/// Provides string conversion for CSS output
extension ColumnCombinator: CustomStringConvertible {
    /// Converts the column combinator to its CSS string representation
    public var description: String {
        return " || "
    }
}
