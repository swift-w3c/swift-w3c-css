public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BreakInside: Property {

    case auto

    case avoid

    case avoidPage

    case avoidColumn

    case avoidRegion

    case global(Global)
}

extension BreakInside {
    public static let property: String = "break-inside"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .avoid: return "avoid"
        case .avoidPage: return "avoid-page"
        case .avoidColumn: return "avoid-column"
        case .avoidRegion: return "avoid-region"
        case .global(let global): return global.description
        }
    }
}
