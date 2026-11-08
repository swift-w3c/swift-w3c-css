extension Quotes {
    public struct Pair: Sendable, Hashable {
        let first: String
        let second: String

        public init(_ first: String, _ second: String) {
            self.first = first
            self.second = second
        }
    }
}
