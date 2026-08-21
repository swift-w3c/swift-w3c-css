public protocol CSSPseudoElement: Sendable, Hashable, CustomStringConvertible {
    static var name: String { get }
}

extension CSSPseudoElement {
    @inlinable package static var prefix: String { "::" }
    public var description: String { Self.prefix + Self.name }
}
