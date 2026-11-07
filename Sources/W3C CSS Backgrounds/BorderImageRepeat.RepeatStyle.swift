public import W3C_CSS_Shared
import W3C_CSS_Values


extension BorderImageRepeat {
    public enum RepeatStyle: String, Sendable, Hashable {

        case stretch

        case `repeat`

        case round

        case space
    }
}
