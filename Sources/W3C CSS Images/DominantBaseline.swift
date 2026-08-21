public import W3C_CSS_Shared

public enum DominantBaseline: Property {

    case auto

    case alphabetic

    case central

    case hanging

    case ideographic

    case mathematical

    case middle

    case textBottom

    case textTop

    case global(Global)
}

extension DominantBaseline {
    public static let property: String = "dominant-baseline"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .alphabetic:
            return "alphabetic"

        case .central:
            return "central"

        case .hanging:
            return "hanging"

        case .ideographic:
            return "ideographic"

        case .mathematical:
            return "mathematical"

        case .middle:
            return "middle"

        case .textBottom:
            return "text-bottom"

        case .textTop:
            return "text-top"

        case .global(let value):
            return value.description
        }
    }
}
