public import W3C_CSS_Shared
public import W3C_CSS_Values


extension Transition {
    public struct Configuration: Sendable, Hashable, CustomStringConvertible {

        public let property: Property

        public let duration: Time

        public let timingFunction: TimingFunction

        public let delay: Time?

        public let behavior: Behavior?

        public init(
            property: Property,
            duration: Time,
            timingFunction: TimingFunction,
            delay: Time? = nil,
            behavior: Behavior? = nil
        ) {
            self.property = property
            self.duration = duration
            self.timingFunction = timingFunction
            self.delay = delay
            self.behavior = behavior
        }
    }
}
