public import W3C_CSS_Shared
public import W3C_CSS_Values


extension ImageResolution {
    public enum Source: Sendable, Hashable {

        case fromImage

        case resolution(Resolution)

        case fromImageWithFallback(Resolution)
    }
}
