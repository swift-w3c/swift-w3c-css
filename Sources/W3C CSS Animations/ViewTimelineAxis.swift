public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ViewTimelineAxis: Property {

    case block

    case inline

    case y

    case x

    case global(Global)
}

extension ViewTimelineAxis {
    public static let property: String = "view-timeline-axis"
}

extension ViewTimelineAxis: CustomStringConvertible {

    public var description: String {
        switch self {
        case .block:
            return "block"

        case .inline:
            return "inline"

        case .y:
            return "y"

        case .x:
            return "x"

        case .global(let global):
            return global.description
        }
    }
}
