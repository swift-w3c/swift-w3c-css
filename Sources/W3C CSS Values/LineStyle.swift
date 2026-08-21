public enum LineStyle: String, Sendable, Hashable, CaseIterable {

    case none

    case hidden

    case dotted

    case dashed

    case solid

    case double

    case groove

    case ridge

    case inset

    case outset
}

extension LineStyle: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}

extension LineStyle {

    public var is3D: Bool {
        switch self {
        case .groove, .ridge, .inset, .outset:
            return true

        default:
            return false
        }
    }

    public var isVisible: Bool {
        switch self {
        case .none, .hidden:
            return false

        default:
            return true
        }
    }

    public var opposite3D: LineStyle? {
        switch self {
        case .groove: return .ridge
        case .ridge: return .groove
        case .inset: return .outset
        case .outset: return .inset
        default: return nil
        }
    }
}
