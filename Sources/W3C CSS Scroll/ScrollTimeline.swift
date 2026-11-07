public import W3C_CSS_Shared
import W3C_CSS_Values

public enum ScrollTimeline: Property {

    case none

    case name(CustomIdent)

    case nameAndAxis(CustomIdent, ScrollTimelineAxis.Axis)

    case global(Global)

}

extension ScrollTimeline {
    public static let property: String = "scroll-timeline"

    public struct CustomIdent: RawRepresentable, Sendable, Hashable, CustomStringConvertible {
        public var rawValue: String

        public init(rawValue: String) {

            if rawValue.hasPrefix("--") {
                self.rawValue = rawValue
            } else {
                self.rawValue = "--" + rawValue
            }
        }
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .name(let name):
            return name.description

        case .nameAndAxis(let name, let axis):
            return "\(name.description) \(axis.rawValue)"

        case .global(let global):
            return global.description
        }
    }

    public static func named(_ name: String) -> Self {
        .name(CustomIdent(rawValue: name))
    }

    public static func named(_ name: String, axis: ScrollTimelineAxis.Axis) -> Self {
        .nameAndAxis(CustomIdent(rawValue: name), axis)
    }
}

extension ScrollTimeline.CustomIdent {
    public var description: String {
        return rawValue
    }
}
