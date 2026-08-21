import W3C_CSS_Shared

public struct NestingSelector: Sendable, Hashable {

    public init() {}

}

extension NestingSelector {

    public static let nesting = NestingSelector()
}

extension NestingSelector: CustomStringConvertible {

    public var description: String {
        return "&"
    }
}
