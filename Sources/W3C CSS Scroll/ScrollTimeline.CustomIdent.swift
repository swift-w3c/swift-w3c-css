public import W3C_CSS_Shared
import W3C_CSS_Values


extension ScrollTimeline {
    public struct CustomIdent: RawRepresentable, Sendable, Hashable, CustomStringConvertible {
        public var rawValue: String

        public init(rawValue: String) {

            if rawValue.hasPrefix("--") {
                self.rawValue = rawValue
            } else {
                self.rawValue = "--" + rawValue
            }
        }
    }
}
