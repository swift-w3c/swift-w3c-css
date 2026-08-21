public protocol LengthPercentageConvertible: LengthConvertible & PercentageConvertible {
    static func lengthPercentage(_ value: LengthPercentage) -> Self
}

extension LengthPercentageConvertible {
    public static func length(_ length: Length) -> Self {
        .lengthPercentage(.length(length))
    }

    public static func percentage(_ percentage: Percentage) -> Self {
        .lengthPercentage(.percentage(percentage))
    }
}

extension LengthPercentageConvertible {
    public static var zero: Self { .length(.zero) }
}

extension LengthPercentageConvertible {
    public init(
        _ value: LengthPercentage
    ) {
        self = .lengthPercentage(value)
    }
}
