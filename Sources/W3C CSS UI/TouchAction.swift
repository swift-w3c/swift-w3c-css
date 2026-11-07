public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TouchAction: Sendable, Hashable, Property {

    case auto

    case none

    case manipulation

    case combined(Set<TouchActionValue>)

    case global(Global)
}

public enum TouchActionValue: String, Sendable, Hashable {

    case panX = "pan-x"

    case panLeft = "pan-left"

    case panRight = "pan-right"

    case panY = "pan-y"

    case panUp = "pan-up"

    case panDown = "pan-down"

    case pinchZoom = "pinch-zoom"
}

extension TouchAction: CustomStringConvertible {
    public static let property: String = "touch-action"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .none:
            return "none"

        case .manipulation:
            return "manipulation"

        case .combined(let values):
            if values.isEmpty {
                return "auto"
            }
            return values.map { $0.rawValue }.sorted().joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

extension TouchAction {

    public static func combined(_ values: TouchActionValue...) -> Self {
        return .combined(Set(values))
    }
}
