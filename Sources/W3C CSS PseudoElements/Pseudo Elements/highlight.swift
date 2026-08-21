public struct Highlight: CSSPseudoElement {

    public let identifier: String?

    public init(_ identifier: String? = nil) {
        self.identifier = identifier
    }
}

extension Highlight {
    @inlinable public static var name: String { "highlight" }
}

extension Highlight: CustomStringConvertible {

    public var description: String {
        if let identifier {
            return Self.prefix + "highlight(\(identifier))"
        } else {
            return Self.prefix + Self.name
        }
    }
}
