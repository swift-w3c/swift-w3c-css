public import W3C_CSS_Shared


extension Marker {
    public enum MarkerValue: Sendable, Hashable, CustomStringConvertible {

        case none

        case url(Url)
    }
}
