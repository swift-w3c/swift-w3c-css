public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationRange: Property, LengthPercentageConvertible {

    case single(AnimationRangeValue)

    case startEnd(AnimationRangeValue, AnimationRangeValue)

    case global(Global)
}

extension AnimationRange {
    public static let property: String = "animation-range"
}

extension AnimationRange {
    public static func lengthPercentage(_ value: LengthPercentage) -> AnimationRange {
        .single(.lengthPercentage(value))
    }

    public static func namedRange(_ name: TimelineRangeName) -> AnimationRange {
        return .single(.namedRange(name))
    }

    public static let normal = AnimationRange.single(.normal)
}

public enum AnimationRangeValue: Sendable, Hashable, LengthPercentageConvertible {

    case normal

    case lengthPercentage(LengthPercentage)

    case namedRange(TimelineRangeName, Percentage? = nil)
}

extension AnimationRange: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let value):
            return value.description

        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"

        case .global(let global):
            return global.description
        }
    }
}

extension AnimationRangeValue: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .lengthPercentage(let lp):
            return lp.description

        case .namedRange(let name, let percentage):
            if let percentage {
                return "\(name.rawValue) \(percentage.description)"
            } else {
                return name.rawValue
            }
        }
    }
}
