import W3C_CSS_Shared
public import W3C_CSS_Syntax
public import W3C_CSS_Values

extension Container {
    public struct SizeComparison: RawRepresentable, Hashable, Sendable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
