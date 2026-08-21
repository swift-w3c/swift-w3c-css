public enum ContentPosition: String, Sendable, Hashable, CaseIterable {

    case center

    case start

    case end

    case flexStart = "flex-start"

    case flexEnd = "flex-end"

    case left

    case right
}

extension ContentPosition: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
