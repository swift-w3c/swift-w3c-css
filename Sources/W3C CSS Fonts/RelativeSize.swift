public enum RelativeSize: String, Sendable, Hashable, CaseIterable {

    case smaller

    case larger
}

extension RelativeSize: CustomStringConvertible {

    public var description: String {
        rawValue
    }
}
