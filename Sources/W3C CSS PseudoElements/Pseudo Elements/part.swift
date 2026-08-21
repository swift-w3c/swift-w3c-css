public struct Part: CSSPseudoElement {

    public let partName: String?

    public init(_ partName: String? = nil) {
        self.partName = partName
    }
}

extension Part {
    @inlinable public static var name: String { "part" }
}

extension Part: CustomStringConvertible {

    public var description: String {
        if let partName {
            return Self.prefix + "part(\(partName))"
        } else {
            return Self.prefix + Self.name
        }
    }
}
