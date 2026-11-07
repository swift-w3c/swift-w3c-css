public enum SelfPosition: String, Sendable, Hashable, CaseIterable {

    case center

    case start

    case end

    case selfStart = "self-start"

    case selfEnd = "self-end"

    case flexStart = "flex-start"

    case flexEnd = "flex-end"

}

extension SelfPosition {

    public static let allPositions: [SelfPosition] = [
        .center, .start, .end, .selfStart, .selfEnd, .flexStart, .flexEnd,
    ]
}

extension SelfPosition: CustomStringConvertible {

    public var description: String {
        rawValue
    }
}

public protocol SelfPositionConvertible {
    static func position(_: OverflowPosition?, _: SelfPosition) -> Self
}

extension SelfPositionConvertible {

    public static var center: Self { .center() }

    public static func center(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .center)
    }

    public static var start: Self { .start() }

    public static func start(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .start)
    }

    public static var end: Self { .end() }

    public static func end(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .end)
    }

    public static var selfStart: Self { .selfStart() }

    public static func selfStart(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .selfStart)
    }

    public static var selfEnd: Self { .selfEnd() }

    public static func selfEnd(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .selfEnd)
    }

    public static var flexStart: Self { .flexStart() }

    public static func flexStart(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .flexStart)
    }

    public static var flexEnd: Self { .flexEnd() }

    public static func flexEnd(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .flexEnd)
    }

    public static func safe(_ position: SelfPosition) -> Self {
        return .position(.safe, position)
    }

    public static func unsafe(_ position: SelfPosition) -> Self {
        return .position(.unsafe, position)
    }
}
