public import W3C_CSS_Shared
import W3C_CSS_Values


extension MaskComposite {
    public enum CompositeOperation: String, Sendable, Hashable {

        case add

        case subtract

        case intersect

        case exclude
    }
}
