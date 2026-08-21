public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BorderImageSource: Property {

    case none

    case url(Url)

    case linearGradient(CSSString)

    case radialGradient(CSSString)

    case conicGradient(CSSString)

    case repeatingLinearGradient(CSSString)

    case repeatingRadialGradient(CSSString)

    case repeatingConicGradient(CSSString)

    case global(Global)
}

extension BorderImageSource {
    public static let property: String = "border-image-source"
}

extension BorderImageSource {

    public static let `default` = BorderImageSource.none
}

extension BorderImageSource: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .url(let path):

            if path.value.hasPrefix("url(") {
                return path.description
            }

            if path.value.contains("\"") || path.value.contains("'") {
                return "url(\(path))"
            }

            return "url(\"\(path)\")"

        case .linearGradient(let value):
            return "linear-gradient(\(value))"

        case .radialGradient(let value):
            return "radial-gradient(\(value))"

        case .conicGradient(let value):
            return "conic-gradient(\(value))"

        case .repeatingLinearGradient(let value):
            return "repeating-linear-gradient(\(value))"

        case .repeatingRadialGradient(let value):
            return "repeating-radial-gradient(\(value))"

        case .repeatingConicGradient(let value):
            return "repeating-conic-gradient(\(value))"

        case .global(let global):
            return global.description
        }
    }
}
