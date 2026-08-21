public protocol NumberConvertible {

    static func number(_ number: Number) -> Self
}

extension NumberConvertible {

    public init(_ number: Number) {
        self = .number(number)
    }

    public init(_ value: Double) {
        self = .number(Number(value))
    }

    public init(_ value: Int) {
        self = .number(Number(value))
    }
}

extension NumberConvertible {

    public static var zero: Self { .number(.zero) }

    public static var one: Self { .number(.one) }
}
