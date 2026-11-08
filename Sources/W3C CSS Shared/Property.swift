public protocol Property: Sendable, Hashable, CustomStringConvertible, GlobalConvertible {

    static var property: String { get }

    var declaration: Declaration { get }
}

extension Property {
    public var declaration: Declaration {
        .init(self)
    }
}

extension Declaration {
    public init<Propery: Property>(_ property: Propery) {
        self.description = "\(Propery.property):\(property.description)"
    }
}
