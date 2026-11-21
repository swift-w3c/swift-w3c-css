public import W3C_CSS_Shared

extension CounterReset {
    public struct Counter: Sendable, Hashable {

        public let name: W3C.CSSOM.CustomIdent

        public let reversed: Bool

        public let value: Int?

        public init(name: W3C.CSSOM.CustomIdent, reversed: Bool = false, value: Int? = nil) {
            self.name = name
            self.reversed = reversed
            self.value = value
        }
    }
}
