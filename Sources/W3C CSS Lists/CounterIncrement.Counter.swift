public import W3C_CSS_Shared

extension CounterIncrement {
    public struct Counter: Sendable, Hashable {

        public let name: CustomIdent

        public let value: Int?

        public init(name: CustomIdent, value: Int? = nil) {
            self.name = name
            self.value = value
        }
    }
}
