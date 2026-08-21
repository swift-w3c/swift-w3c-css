public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnimationDirection: Property {

    case normal

    case reverse

    case alternate

    case alternateReverse

    case global(Global)
}

extension AnimationDirection {
    public static let property: String = "animation-direction"
}

extension AnimationDirection {
    public static let allCases: [AnimationDirection] =
        [
            .normal,
            .reverse,
            .alternate,
            .alternateReverse,
        ] + Global.allCases.map(AnimationDirection.global)
}

extension AnimationDirection: CustomStringConvertible {

    public var description: String {
        switch self {
        case .normal: return "normal"
        case .reverse: return "reverse"
        case .alternate: return "alternate"
        case .alternateReverse: return "alternate-reverse"
        case .global(let global): return global.description
        }
    }
}
