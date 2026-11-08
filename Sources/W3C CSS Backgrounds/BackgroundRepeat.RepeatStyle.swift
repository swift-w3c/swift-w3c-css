public import W3C_CSS_Shared
import W3C_CSS_Values

extension BackgroundRepeat {
    public enum RepeatStyle: String, Sendable, Hashable {

        case `repeat` = "repeat"

        case noRepeat = "no-repeat"

        case repeatX = "repeat-x"

        case repeatY = "repeat-y"

        case space = "space"

        case round = "round"
    }
}
