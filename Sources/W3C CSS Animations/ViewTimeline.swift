public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ViewTimeline: Property {

    case name(ViewTimelineName)

    case nameAndAxis(ViewTimelineName, ViewTimelineAxis)

    case global(Global)
}

extension ViewTimeline {
    public static let property: String = "view-timeline"
}

extension ViewTimeline: CustomStringConvertible {

    public var description: String {
        switch self {
        case .name(let name):
            return name.description

        case .nameAndAxis(let name, let axis):
            return "\(name) \(axis)"

        case .global(let global):
            return global.description
        }
    }
}

extension ViewTimeline {

    public static func custom(_ name: String) -> Self {
        return .name(.custom(name))
    }

    public static func custom(_ name: String, _ axis: ViewTimelineAxis) -> Self {
        return .nameAndAxis(.custom(name), axis)
    }
}
