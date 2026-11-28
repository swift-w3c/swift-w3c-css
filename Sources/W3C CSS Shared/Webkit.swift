/// A property under WebKit's vendor prefix: the same value, declared as `-webkit-` and the property's name.
public struct Webkit<Base: Property>: Property {
    public var base: Base

    public init(_ base: Base) {
        self.base = base
    }

    public static var property: String { "-webkit-" + Base.property }

    public static func global(_ global: Global) -> Self {
        .init(.global(global))
    }

    public var description: String { base.description }
}
