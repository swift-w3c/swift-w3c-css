public import W3C_CSS_Shared
import W3C_CSS_Values


extension PositionTryFallbacks {
    public enum FallbackOption: Sendable, Hashable {

        case tactic(TryTactic)

        case positionArea(CSSString)

        case customOption(CSSString)
    }
}
