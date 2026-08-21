public enum DisplayBox: String, Sendable, Hashable {

    case none

    case contents
}

extension DisplayBox: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
