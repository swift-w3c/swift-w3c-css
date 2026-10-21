public struct Cue: CSSPseudoElement {

    public let selector: String?

    public init(_ selector: String? = nil) {
        self.selector = selector
    }
}

extension Cue {
    @inlinable public static var name: String { "cue" }
}

extension Cue: CustomStringConvertible {

    public var description: String {
        guard let selector else {
            return Self.prefix + Self.name
        }
        return Self.prefix + "cue(\(selector))"
    }
}
