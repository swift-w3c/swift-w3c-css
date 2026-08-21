public import W3C_CSS_Shared
import W3C_CSS_Values

public enum AnimationTimeline: Property {

    case none

    case auto

    case named(DashedIdent)

    case scroll(ScrollerValue? = nil, ScrollAxis? = nil)

    case view(ScrollAxis? = nil, ViewTimelineInset? = nil)

    case global(Global)
}

extension AnimationTimeline {
    public static let property: String = "animation-timeline"
}

public enum ScrollerValue: String, Sendable, Hashable, CaseIterable {

    case root

    case nearest

    case `self`
}

public enum ScrollAxis: String, Sendable, Hashable, CaseIterable {

    case block

    case inline

    case x

    case y
}

extension AnimationTimeline: CustomStringConvertible {

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .auto:
            return "auto"

        case .named(let name):
            return name.description

        case .scroll(let scroller, let axis):
            var params: [String] = []
            if let scroller {
                params.append(scroller.rawValue)
            }
            if let axis {
                params.append(axis.rawValue)
            }
            return "scroll(\(params.joined(separator: " ")))"

        case .view(let axis, let inset):
            var params: [String] = []
            if let axis {
                params.append(axis.rawValue)
            }
            if let inset {
                params.append(inset.description)
            }
            return "view(\(params.joined(separator: " ")))"

        case .global(let global):
            return global.description
        }
    }
}
