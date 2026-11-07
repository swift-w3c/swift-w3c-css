public import W3C_CSS_Shared
import W3C_CSS_Values

public enum PositionTryFallbacks: Property {

    case none

    case tactic(TryTactic)

    case tactics([TryTactic])

    case positionArea(CSSString)

    case customOption(CSSString)

    case combined([FallbackOption])

    case global(Global)
}

extension PositionTryFallbacks {
    public static let property: String = "position-try-fallbacks"

    public enum TryTactic: String, Sendable, Hashable {

        case flipBlock = "flip-block"

        case flipInline = "flip-inline"

        case flipStart = "flip-start"
    }

    public enum FallbackOption: Sendable, Hashable {

        case tactic(TryTactic)

        case positionArea(CSSString)

        case customOption(CSSString)
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .tactic(let tactic):
            return tactic.rawValue

        case .tactics(let tactics):
            return tactics.map { $0.rawValue }.joined(separator: ", ")

        case .positionArea(let area):
            return area.description

        case .customOption(let option):
            return option.description

        case .combined(let options):
            return options.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }

    public static func combine(_ options: FallbackOption...) -> PositionTryFallbacks {
        .combined(options)
    }
}

extension PositionTryFallbacks.FallbackOption {

    var description: String {
        switch self {
        case .tactic(let tactic):
            return tactic.rawValue

        case .positionArea(let area):
            return area.description

        case .customOption(let option):
            return option.description
        }
    }
}
