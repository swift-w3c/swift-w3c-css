public protocol GlobalConvertible {
    static func global(_ global: Global) -> Self
}

extension GlobalConvertible {
    public init(_ global: Global) {
        self = .global(global)
    }
}

extension GlobalConvertible {

    public static var inherit: Self { .global(.inherit) }

    public static var initial: Self { .global(.initial) }

    public static var revert: Self { .global(.revert) }

    public static var revertLayer: Self { .global(.revertLayer) }

    public static var unset: Self { .global(.unset) }
}
