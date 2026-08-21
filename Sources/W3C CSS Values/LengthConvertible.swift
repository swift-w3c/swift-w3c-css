public protocol LengthConvertible {

    static func length(_ length: Length) -> Self
}

extension LengthConvertible {

    public init(_ length: Length) {
        self = .length(length)
    }
}

extension LengthConvertible {

    public static func fr(_ value: Double) -> Self { .length(.fr(value)) }

    public static func px(_ value: Double) -> Self { .length(.px(value)) }

    public static func em(_ value: Double) -> Self { .length(.em(value)) }

    public static func rem(_ value: Double) -> Self { .length(.rem(value)) }

    public static func vw(_ value: Double) -> Self { .length(.vw(value)) }

    public static func vh(_ value: Double) -> Self { .length(.vh(value)) }

    public static func vmin(_ value: Double) -> Self { .length(.length(value, .vmin)) }

    public static func vmax(_ value: Double) -> Self { .length(.length(value, .vmax)) }

}
