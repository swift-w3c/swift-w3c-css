public import W3C_CSS_Shared
import W3C_CSS_Values


extension PositionTryFallbacks {
    public enum TryTactic: String, Sendable, Hashable {

        case flipBlock = "flip-block"

        case flipInline = "flip-inline"

        case flipStart = "flip-start"
    }
}
