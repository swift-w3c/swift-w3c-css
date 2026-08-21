public enum OverflowPosition: String, Sendable, Hashable, CaseIterable {

    case safe

    case unsafe
}

extension OverflowPosition: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
