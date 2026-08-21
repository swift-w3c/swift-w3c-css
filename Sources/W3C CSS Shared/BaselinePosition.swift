public struct BaselinePosition: Sendable, Hashable {
    let firstLast: FirstLast?

    public init(firstLast: FirstLast?) {
        self.firstLast = firstLast
    }
}

extension BaselinePosition {
    public enum FirstLast: String, Sendable, Hashable, CustomStringConvertible {

        case first

        case last
    }

    public static let first: Self = .init(firstLast: .first)
    public static let last: Self = .init(firstLast: .last)
    public static let firstBaseline: Self = .init(firstLast: .first)
    public static let lastBaseline: Self = .init(firstLast: .last)
    public static let baseline: Self = .init(firstLast: nil)
    public static func baseline(_ firstLast: FirstLast) -> Self { .init(firstLast: firstLast) }
}

extension BaselinePosition.FirstLast {
    public var description: String { rawValue }
}

extension BaselinePosition: CustomStringConvertible {

    public var description: String {
        return firstLast.map { "\($0) baseline" } ?? "baseline"
    }
}

public protocol BaselinePositionConvertible {
    static func baseline(_: BaselinePosition) -> Self
}

extension BaselinePositionConvertible {

    public static var firstBaseline: Self { .baseline(.firstBaseline) }

    public static var lastBaseline: Self { .baseline(.lastBaseline) }

    public static var baseline: Self { .baseline(.baseline) }
}
