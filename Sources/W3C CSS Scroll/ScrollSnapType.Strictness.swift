public import W3C_CSS_Shared
import W3C_CSS_Values


extension ScrollSnapType {
    public enum Strictness: String, Sendable {

        case mandatory

        case proximity
    }
}
