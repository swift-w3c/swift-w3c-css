import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

public struct Container: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ name: String? = nil, _ condition: Condition) {
        if let name {
            self.rawValue = "@container \(name) \(condition.rawValue)"
        } else {
            self.rawValue = "@container \(condition.rawValue)"
        }
    }
}

extension Container {
    public static let identifier: String = "container"

    public static func width(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .width(comparison))
    }

    public static func height(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .height(comparison))
    }

    public static func inlineSize(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .inlineSize(comparison))
    }

    public static func blockSize(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .blockSize(comparison))
    }

    public static func aspectRatio(name: String? = nil, _ comparison: RatioComparison) -> Container
    {
        Container(name, .aspectRatio(comparison))
    }

    public static func orientation(name: String? = nil, _ orientation: Orientation) -> Container {
        Container(name, .orientation(orientation))
    }

    public static func scrollState(name: String? = nil, _ state: ScrollState) -> Container {
        Container(name, .scrollState(state))
    }

    public static func style(name: String? = nil, _ feature: String) -> Container {
        Container(name, .style(feature))
    }

    public static func not(name: String? = nil, _ condition: Condition) -> Container {
        Container(name, .not(condition))
    }

    public func and(_ condition: Condition) -> Container {

        let existingCondition = String(rawValue.dropFirst(11))
        return Container(rawValue: "@container \(existingCondition) and \(condition.rawValue)")
    }

    public func or(_ condition: Condition) -> Container {

        let existingCondition = String(rawValue.dropFirst(11))
        return Container(rawValue: "@container \(existingCondition) or \(condition.rawValue)")
    }
}

extension Container {

    public struct Condition: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    public struct SizeComparison: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    public struct RatioComparison: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

    public enum Orientation: String, Hashable, Sendable {
        case portrait
        case landscape
    }

    public struct ScrollState: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }

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

    public static func width(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(width \(comparison.rawValue))")
    }

    public static func height(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(height \(comparison.rawValue))")
    }

    public static func inlineSize(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(inline-size \(comparison.rawValue))")
    }

    public static func blockSize(_ comparison: Container.SizeComparison) -> Container.Condition {
        Container.Condition(rawValue: "(block-size \(comparison.rawValue))")
    }

    public static func aspectRatio(_ comparison: Container.RatioComparison) -> Container.Condition {
        Container.Condition(rawValue: "(aspect-ratio \(comparison.rawValue))")
    }

    public static func orientation(_ orientation: Container.Orientation) -> Container.Condition {
        Container.Condition(rawValue: "(orientation: \(orientation.rawValue))")
    }

    public static func scrollState(_ state: Container.ScrollState) -> Container.Condition {
        Container.Condition(rawValue: "scroll-state(\(state.rawValue))")
    }

    public static func style(_ feature: String) -> Container.Condition {
        Container.Condition(rawValue: "style(\(feature))")
    }

    public static func not(_ condition: Container.Condition) -> Container.Condition {
        Container.Condition(rawValue: "not \(condition.rawValue)")
    }
}

extension Container.SizeComparison {

    public static func equalTo(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "= \(value)")
    }

    public static func greaterThan(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "> \(value)")
    }

    public static func lessThan(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "< \(value)")
    }

    public static func greaterThanOrEqual(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: ">= \(value)")
    }

    public static func lessThanOrEqual(_ value: LengthPercentage) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "<= \(value)")
    }

    public static func range(
        min: LengthPercentage,
        max: LengthPercentage
    ) -> Container.SizeComparison {
        Container.SizeComparison(rawValue: "\(min) <= && <= \(max)")
    }
}

extension Container.RatioComparison {

    public static func equalTo(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "= \(width)/\(height)")
    }

    public static func greaterThan(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "> \(width)/\(height)")
    }

    public static func lessThan(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "< \(width)/\(height)")
    }

    public static func greaterThanOrEqual(_ width: Int, _ height: Int) -> Container.RatioComparison
    {
        Container.RatioComparison(rawValue: ">= \(width)/\(height)")
    }

    public static func lessThanOrEqual(_ width: Int, _ height: Int) -> Container.RatioComparison {
        Container.RatioComparison(rawValue: "<= \(width)/\(height)")
    }
}

extension Container.ScrollState {

    public static func scrollable(_ direction: Container.ScrollDirection) -> Container.ScrollState {
        Container.ScrollState(rawValue: "scrollable: \(direction.rawValue)")
    }

    public static func stuck(_ direction: Container.ScrollDirection) -> Container.ScrollState {
        Container.ScrollState(rawValue: "stuck: \(direction.rawValue)")
    }

    public static func snapped(_ direction: Container.ScrollDirection) -> Container.ScrollState {
        Container.ScrollState(rawValue: "snapped: \(direction.rawValue)")
    }
}

extension Container {

    public static func && (lhs: Container, rhs: Container) -> Container {

        let rhsCondition = String(rhs.rawValue.dropFirst(11))
        return lhs.and(Condition(rawValue: rhsCondition))
    }

    public static func || (lhs: Container, rhs: Container) -> Container {

        let rhsCondition = String(rhs.rawValue.dropFirst(11))
        return lhs.or(Condition(rawValue: rhsCondition))
    }
}
