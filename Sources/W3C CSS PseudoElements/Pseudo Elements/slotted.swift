public struct Slotted: CSSPseudoElement {

    public let selector: String?

    public init(_ selector: String? = nil) {
        self.selector = selector
    }
}

extension Slotted {
    @inlinable public static var name: String { "slotted" }
}

extension Slotted: CustomStringConvertible {

    public var description: String {
        if let selector {
            return Self.prefix + "slotted(\(selector))"
        } else {
            return Self.prefix + Self.name
        }
    }
}
