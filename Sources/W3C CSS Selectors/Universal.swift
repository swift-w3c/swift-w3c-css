import W3C_CSS_Shared

public struct UniversalSelector: Sendable, Hashable {

    public init() {}

}

extension UniversalSelector {

    public static let universal = UniversalSelector()
}

extension UniversalSelector: CustomStringConvertible {

    public var description: String {
        return "*"
    }
}
