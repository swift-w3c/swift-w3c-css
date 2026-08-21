public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AnimationRangeEnd: Property, LengthPercentageConvertible {

    case normal

    case lengthPercentage(LengthPercentage)

    case namedRange(TimelineRangeName, Percentage? = nil)

    case global(Global)
}

extension AnimationRangeEnd {
    public static let property: String = "animation-range-end"
}

extension AnimationRangeEnd: CustomStringConvertible {

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
