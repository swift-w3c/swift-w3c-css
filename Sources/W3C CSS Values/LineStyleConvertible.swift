public protocol LineStyleConvertible {
    static func lineStyle(_ lineStyle: LineStyle) -> Self
}

extension LineStyleConvertible {

    public init(_ lineStyle: LineStyle) {
        self = .lineStyle(lineStyle)
    }
}

extension LineStyleConvertible {
    public static var none: Self { .lineStyle(.none) }
    public static var hidden: Self { .lineStyle(.hidden) }
    public static var dotted: Self { .lineStyle(.dotted) }
    public static var dashed: Self { .lineStyle(.dashed) }
    public static var solid: Self { .lineStyle(.solid) }
    public static var double: Self { .lineStyle(.double) }
    public static var groove: Self { .lineStyle(.groove) }
    public static var ridge: Self { .lineStyle(.ridge) }
    public static var inset: Self { .lineStyle(.inset) }
    public static var outset: Self { .lineStyle(.outset) }
}
