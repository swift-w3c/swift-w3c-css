public import W3C_CSS_Shared
public import W3C_CSS_Values

public enum AspectRatio: Property {

    case auto

    case ratio(Ratio)

    case autoWithFallback(Ratio)

    case ratioWithAuto(Ratio)

    case global(Global)
}

extension AspectRatio {
    public static let property: String = "aspect-ratio"

    public static func ratio(
        _ width: Double,
        _ height: Double
    ) throws(Ratio.RatioError) -> AspectRatio {
        return try .ratio(Ratio(width, height))
    }

    public static func ratio(_ width: Int, _ height: Int) throws(Ratio.RatioError) -> AspectRatio {
        return try .ratio(Ratio(width, height))
    }

    public static func square() -> AspectRatio {
        return .ratio(Ratio.square)
    }

    public static func widescreen() -> AspectRatio {
        return .ratio(Ratio.widescreen)
    }
}

extension AspectRatio: CustomStringConvertible {

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .ratio(let ratio):
            return ratio.description

        case .autoWithFallback(let ratio):
            return "auto \(ratio.description)"

        case .ratioWithAuto(let ratio):
            return "\(ratio.description) auto"

        case .global(let global):
            return global.description
        }
    }
}
