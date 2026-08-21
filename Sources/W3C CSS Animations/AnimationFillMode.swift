public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnimationFillMode: Property {

    case none

    case forwards

    case backwards

    case both

    case global(Global)
}

extension AnimationFillMode {
    public static let property: String = "animation-fill-mode"
}

extension AnimationFillMode: CaseIterable {
    public static let allCases: [AnimationFillMode] =
        [
            .none,
            .forwards,
            .backwards,
            .both,
        ] + Global.allCases.compactMap(AnimationFillMode.global)
}

extension AnimationFillMode: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none: return "none"
        case .forwards: return "forwards"
        case .backwards: return "backwards"
        case .both: return "both"
        case .global(let global): return global.description
        }
    }
}
