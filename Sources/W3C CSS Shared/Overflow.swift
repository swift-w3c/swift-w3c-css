public enum Overflow: String, Sendable, Hashable, CaseIterable {

    case visible

    case hidden

    case clip

    case scroll

    case auto

    @available(*, deprecated, message: "Use 'auto' instead. The overlay value is deprecated.")
    case overlay

}

extension Overflow {

    public static var allCases: [Overflow] {
        [.visible, .hidden, .clip, .scroll, .auto]
    }
}

extension Overflow: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}

extension Overflow {

    public var allowsVisibleOverflow: Bool {
        switch self {
        case .visible:
            return true

        default:
            return false
        }
    }

    public var clipsContent: Bool {
        switch self {
        case .hidden, .clip, .scroll, .auto, .overlay:
            return true

        case .visible:
            return false
        }
    }

    public var showsScrollbars: Bool {
        switch self {
        case .scroll, .auto, .overlay:
            return true

        case .visible, .hidden, .clip:
            return false
        }
    }
}
