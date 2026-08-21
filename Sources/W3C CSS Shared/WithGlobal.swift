public enum WithGlobal<T: Sendable & Hashable>: Sendable, Hashable {

    case value(T)

    case global(Global)

    @inlinable
    public init(_ value: T) {
        self = .value(value)
    }

    @inlinable
    public init(_ global: Global) {
        self = .global(global)
    }

    @inlinable
    public func map<U: Sendable & Hashable>(_ transform: (T) -> U) -> WithGlobal<U> {
        switch self {
        case .value(let t):
            return .value(transform(t))

        case .global(let g):
            return .global(g)
        }
    }

    @inlinable
    public func flatMap<U: Sendable & Hashable>(_ transform: (T) -> WithGlobal<U>) -> WithGlobal<U>
    {
        switch self {
        case .value(let t):
            return transform(t)

        case .global(let g):
            return .global(g)
        }
    }
}

extension WithGlobal: GlobalConvertible {}

extension WithGlobal: CustomStringConvertible where T: CustomStringConvertible {
    public var description: String {
        switch self {
        case .value(let t):
            return t.description

        case .global(let g):
            return g.description
        }
    }
}
