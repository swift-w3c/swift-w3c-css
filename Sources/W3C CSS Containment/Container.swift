public import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

/// Represents a CSS @container at-rule.
///
/// The @container CSS at-rule is a conditional group rule that applies styles to a
/// containment context. Style declarations are filtered by a condition and applied to
/// the container if the condition is true.
///
/// Examples:
/// ```swift
/// // Simple width query
/// Container.width(.greaterThan(.px(400)))
///
/// // Query with a container name
/// Container("sidebar", .maxWidth(.px(300)))
///
/// // Combining conditions with 'and'
/// Container.width(.greaterThan(.px(400)))
///     .and(.height(.greaterThan(.px(300))))
///
/// // Combining conditions with 'or'
/// Container.width(.greaterThan(.px(400)))
///     .or(.height(.greaterThan(.px(300))))
///
/// // Using the 'not' operator
/// Container.not(.width(.lessThan(.px(400))))
///
/// // Using scroll state
/// Container.scrollState(.scrollable(.top))
/// ```
public struct Container: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a container query with a name and condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - condition: The condition to apply.
    public init(_ name: String? = nil, _ condition: Condition) {
        if let name = name {
            self.rawValue = "@container \(name) \(condition.rawValue)"
        } else {
            self.rawValue = "@container \(condition.rawValue)"
        }
    }
}

extension Container {
    public static let identifier: String = "container"

    /// Creates a container query with a width condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The width comparison.
    /// - Returns: A new Container instance.
    public static func width(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .width(comparison))
    }

    /// Creates a container query with a height condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The height comparison.
    /// - Returns: A new Container instance.
    public static func height(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .height(comparison))
    }

    /// Creates a container query with an inline-size condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The inline-size comparison.
    /// - Returns: A new Container instance.
    public static func inlineSize(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .inlineSize(comparison))
    }

    /// Creates a container query with a block-size condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The block-size comparison.
    /// - Returns: A new Container instance.
    public static func blockSize(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .blockSize(comparison))
    }

    /// Creates a container query with an aspect-ratio condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The aspect-ratio comparison.
    /// - Returns: A new Container instance.
    public static func aspectRatio(name: String? = nil, _ comparison: RatioComparison) -> Container
    {
        Container(name, .aspectRatio(comparison))
    }

    /// Creates a container query with an orientation condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - orientation: The orientation.
    /// - Returns: A new Container instance.
    public static func orientation(name: String? = nil, _ orientation: Orientation) -> Container {
        Container(name, .orientation(orientation))
    }

    /// Creates a container query with a scroll-state condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - state: The scroll state to query.
    /// - Returns: A new Container instance.
    public static func scrollState(name: String? = nil, _ state: ScrollState) -> Container {
        Container(name, .scrollState(state))
    }

    /// Creates a container query with a style condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - feature: The style feature to query.
    /// - Returns: A new Container instance.
    public static func style(name: String? = nil, _ feature: String) -> Container {
        Container(name, .style(feature))
    }

    /// Creates a container query with a negated condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - condition: The condition to negate.
    /// - Returns: A new Container instance.
    public static func not(name: String? = nil, _ condition: Condition) -> Container {
        Container(name, .not(condition))
    }

    /// Combines this container query with another using the 'and' operator.
    ///
    /// - Parameter condition: The condition to add.
    /// - Returns: A new Container instance.
    public func and(_ condition: Condition) -> Container {
        // Extract existing condition string by removing "@container " prefix
        let existingCondition = String(rawValue.dropFirst(11))
        return Container(rawValue: "@container \(existingCondition) and \(condition.rawValue)")
    }

    /// Combines this container query with another using the 'or' operator.
    ///
    /// - Parameter condition: The condition to add.
    /// - Returns: A new Container instance.
    public func or(_ condition: Condition) -> Container {
        // Extract existing condition string by removing "@container " prefix
        let existingCondition = String(rawValue.dropFirst(11))
        return Container(rawValue: "@container \(existingCondition) or \(condition.rawValue)")
    }
}

// MARK: - Container Conditions

extension Container {
    /// Represents a condition in a container query.
    public struct Condition: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    /// Represents a size comparison in a container query.
    public struct SizeComparison: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    /// Represents a ratio comparison in a container query.
    public struct RatioComparison: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    /// Represents orientation values for container queries.
    public enum Orientation: String, Hashable, Sendable {
        case portrait
        case landscape
    }

    /// Represents a scroll state query in a container query.
    public struct ScrollState: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    /// Represents scroll directions for scroll state queries.
    public enum ScrollDirection: String, Hashable, Sendable {
        case none
        case top
        case right
        case bottom
        case left
        case x
        case y
        case blockStart = "block-start"
        case blockEnd = "block-end"
        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"
        case block
        case inline
        case both
    }
}

extension Container.Condition {
    /// Creates a width condition.
    public static func width(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(width \(comparison.rawValue))")
    }

    /// Creates a height condition.
    public static func height(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(height \(comparison.rawValue))")
    }

    /// Creates an inline-size condition.
    public static func inlineSize(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(inline-size \(comparison.rawValue))")
    }

    /// Creates a block-size condition.
    public static func blockSize(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(block-size \(comparison.rawValue))")
    }

    /// Creates an aspect-ratio condition.
    public static func aspectRatio(_ comparison: Container.RatioComparison) -> Container.Condition {
        Container.Condition(rawValue: "(aspect-ratio \(comparison.rawValue))")
    }

    /// Creates an orientation condition.
    public static func orientation(_ orientation: Container.Orientation) -> Container.Condition {
        Container.Condition(rawValue: "(orientation: \(orientation.rawValue))")
    }

    /// Creates a scroll-state condition.
    public static func scrollState(_ state: Container.ScrollState) -> Container.Condition {
        Container.Condition(rawValue: "scroll-state(\(state.rawValue))")
    }

    /// Creates a style condition.
    public static func style(_ feature: String) -> Container.Condition {
        Container.Condition(rawValue: "style(\(feature))")
    }

    /// Creates a negated condition.
    public static func not(_ condition: Container.Condition) -> Container.Condition {
        Container.Condition(rawValue: "not \(condition.rawValue)")
    }
}

extension Container.SizeComparison {
    /// Creates an equals comparison.
    public static func equalTo(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "= \(value)")
    }

    /// Creates a greater than comparison.
    public static func greaterThan(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "> \(value)")
    }

    /// Creates a less than comparison.
    public static func lessThan(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "< \(value)")
    }

    /// Creates a greater than or equal to comparison.
    public static func greaterThanOrEqual(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: ">= \(value)")
    }

    /// Creates a less than or equal to comparison.
    public static func lessThanOrEqual(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "<= \(value)")
    }

    /// Creates a range comparison.
    public static func range(min: LengthPercentage, max: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "\(min) <= && <= \(max)")
    }
}

extension Container.RatioComparison {
    /// Creates an equals comparison.
    public static func equalTo(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "= \(width)/\(height)")
    }

    /// Creates a greater than comparison.
    public static func greaterThan(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "> \(width)/\(height)")
    }

    /// Creates a less than comparison.
    public static func lessThan(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "< \(width)/\(height)")
    }

    /// Creates a greater than or equal to comparison.
    public static func greaterThanOrEqual(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: ">= \(width)/\(height)")
    }

    /// Creates a less than or equal to comparison.
    public static func lessThanOrEqual(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "<= \(width)/\(height)")
    }
}

extension Container.ScrollState {
    /// Creates a scrollable scroll state query.
    public static func scrollable(_ direction: Container.ScrollDirection) -> Container.ScrollState {
        Container.ScrollState(rawValue: "scrollable: \(direction.rawValue)")
    }

    /// Creates a stuck scroll state query.
    public static func stuck(_ direction: Container.ScrollDirection) -> Container.ScrollState {
        Container.ScrollState(rawValue: "stuck: \(direction.rawValue)")
    }

    /// Creates a snapped scroll state query.
    public static func snapped(_ direction: Container.ScrollDirection) -> Container.ScrollState {
        Container.ScrollState(rawValue: "snapped: \(direction.rawValue)")
    }
}

// MARK: - Operator Overloads

extension Container {
    /// Operator for combining conditions with the 'and' operator.
    ///
    /// Example:
    /// ```swift
    /// let query = Container.width(.greaterThan(.px(400))) && Container.height(.greaterThan(.px(300)))
    /// ```
    public static func && (lhs: Container, rhs: Container) -> Container {
        // Extract condition from right-hand side by removing "@container " prefix
        let rhsCondition = String(rhs.rawValue.dropFirst(11))
        return lhs.and(Condition(rawValue: rhsCondition))
    }

    /// Operator for combining conditions with the 'or' operator.
    ///
    /// Example:
    /// ```swift
    /// let query = Container.width(.greaterThan(.px(400))) || Container.height(.greaterThan(.px(300)))
    /// ```
    public static func || (lhs: Container, rhs: Container) -> Container {
        // Extract condition from right-hand side by removing "@container " prefix
        let rhsCondition = String(rhs.rawValue.dropFirst(11))
        return lhs.or(Condition(rawValue: rhsCondition))
    }
}
