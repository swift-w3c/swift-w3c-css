public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnimationPlayState: Property {

    case running

    case paused

    case global(Global)
}

extension AnimationPlayState {
    public static let property: String = "animation-play-state"
}

extension AnimationPlayState: CaseIterable {
    public static let allCases: [AnimationPlayState] =
        [.running, .paused] + Global.allCases.map { AnimationPlayState.global($0) }
}

extension AnimationPlayState: CustomStringConvertible {

    public var description: String {
        switch self {
        case .running:
            return "running"

        case .paused:
            return "paused"

        case .global(let global):
            return global.description
        }
    }
}
