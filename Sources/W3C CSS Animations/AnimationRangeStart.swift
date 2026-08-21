public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationRangeStart: Property, LengthPercentageConvertible {

    case normal

    case lengthPercentage(LengthPercentage)

    case namedRange(TimelineRangeName, Percentage? = nil)

    case global(Global)
}

extension AnimationRangeStart {
    public static let property: String = "animation-range-start"
}

public enum TimelineRangeName: String, Sendable, Hashable, CaseIterable {

    case cover

    case contain

    case entry

    case exit

    case entryCrossing = "entry-crossing"

    case exitCrossing = "exit-crossing"
}

extension AnimationRangeStart: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .lengthPercentage(let lp):
            return lp.description

        case .namedRange(let name, let percentage):
            if let percentage {
                return "\(name.rawValue) \(percentage)"
            } else {
                return name.rawValue
            }

        case .global(let global):
            return global.description
        }
    }
}
