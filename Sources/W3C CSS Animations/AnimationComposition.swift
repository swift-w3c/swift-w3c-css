public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnimationComposition: Property {

    case replace

    case add

    case accumulate

    case global(Global)
}

extension AnimationComposition {
    public static let property: String = "animation-composition"
}

extension AnimationComposition: CaseIterable {
    public static let allCases: [AnimationComposition] =
        [.replace, .add, .accumulate] + Global.allCases.map(AnimationComposition.global)
}

extension AnimationComposition: CustomStringConvertible {

    public var description: String {
        switch self {
        case .replace:
            return "replace"

        case .add:
            return "add"

        case .accumulate:
            return "accumulate"

        case .global(let global):
            return global.description
        }
    }
}
