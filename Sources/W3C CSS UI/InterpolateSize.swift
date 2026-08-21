public import W3C_CSS_Shared
import W3C_CSS_Values

public enum InterpolateSize: Property {

    case numericOnly

    case allowKeywords

    case global(Global)
}

extension InterpolateSize {
    public static let property: String = "interpolate-size"

    public var description: String {
        switch self {
        case .numericOnly:
            return "numeric-only"

        case .allowKeywords:
            return "allow-keywords"

        case .global(let global):
            return global.description
        }
    }
}
