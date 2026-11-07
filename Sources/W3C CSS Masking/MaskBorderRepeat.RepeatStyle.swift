public import W3C_CSS_Shared
import W3C_CSS_Values


extension MaskBorderRepeat {
    public enum RepeatStyle: String, Sendable, Hashable {

        case stretch

        case `repeat`

        case round

        case space
    }
}
