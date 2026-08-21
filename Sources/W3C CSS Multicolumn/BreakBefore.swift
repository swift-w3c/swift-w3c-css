public import W3C_CSS_Shared
import W3C_CSS_Values

public enum BreakBefore: Property {

    case auto

    case avoid

    case always

    case all

    case avoidPage

    case page

    case left

    case right

    case recto

    case verso

    case avoidColumn

    case column

    case avoidRegion

    case region

    case global(Global)
}

extension BreakBefore {
    public static let property: String = "break-before"

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .avoid: return "avoid"
        case .always: return "always"
        case .all: return "all"
        case .avoidPage: return "avoid-page"
        case .page: return "page"
        case .left: return "left"
        case .right: return "right"
        case .recto: return "recto"
        case .verso: return "verso"
        case .avoidColumn: return "avoid-column"
        case .column: return "column"
        case .avoidRegion: return "avoid-region"
        case .region: return "region"
        case .global(let global): return global.description
        }
    }
}
