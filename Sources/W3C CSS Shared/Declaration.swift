public struct Declaration: Sendable, Hashable, CustomStringConvertible {
    public let description: String

    public init(description: String) {
        self.description = description
    }
}
