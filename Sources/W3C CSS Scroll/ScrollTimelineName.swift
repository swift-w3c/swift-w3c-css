public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollTimelineName: Property {

    case none

    case name(ScrollTimeline.CustomIdent)

    case global(Global)

}

extension ScrollTimelineName {
    public static let property: String = "scroll-timeline-name"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .name(let name):
            return name.description

        case .global(let global):
            return global.description
        }
    }

    public static func named(_ name: String) -> Self {
        .name(ScrollTimeline.CustomIdent(rawValue: name))
    }
}
