public protocol Property: Sendable, Hashable, CustomStringConvertible, GlobalConvertible {

    static var property: String { get }

    var declaration: Declaration { get }
}

extension Property {
    public var declaration: Declaration {
        .init(self)
    }
}

public struct Declaration: Sendable, Hashable, CustomStringConvertible {
    public let description: String

    public init(description: String) {
        self.description = description
    }
}

extension Declaration {
    public init<Propery: Property>(_ property: Propery) {
        self.description = "\(Propery.property):\(property.description)"
    }
}
