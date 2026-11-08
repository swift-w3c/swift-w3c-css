public import W3C_CSS_Shared

extension CounterReset {
    public struct Counter: Sendable, Hashable {

        public let name: CustomIdent

        public let reversed: Bool

        public let value: Int?

        public init(name: CustomIdent, reversed: Bool = false, value: Int? = nil) {
            self.name = name
            self.reversed = reversed
            self.value = value
        }
    }
}
