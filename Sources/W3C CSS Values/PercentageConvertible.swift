public protocol PercentageConvertible {
    static func percentage(_ percentage: Percentage) -> Self
}

extension PercentageConvertible {

    public init(_ percentage: Percentage) {
        self = .percentage(percentage)
    }
}

extension PercentageConvertible {

    public static var zero: Self { .init(.zero) }

    public static var half: Self { .init(.half) }

    public static var full: Self { .init(.full) }

    public static func percent(_ percent: Percentage) -> Self {
        .percentage(percent)
    }
}
