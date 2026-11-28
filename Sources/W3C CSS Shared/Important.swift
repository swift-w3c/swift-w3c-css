/// A property whose declaration carries `!important` (CSS Cascading Level 4, section 6.4).
public struct Important<Base: Property>: Property {

    public let base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

extension Important {

    public static var property: String { Base.property }

    public var description: String { base.description }

    public var declaration: Declaration { base.declaration.important }

    public static func global(_ global: Global) -> Self {
        Self(Base.global(global))
    }
}

extension Property {
    /// The same value, declared `!important`.
    public var important: Important<Self> { Important(self) }
}
