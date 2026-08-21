public protocol AngleConvertible {

    static func angle(_ angle: Angle) -> Self
}

extension AngleConvertible {

    public init(_ angle: Angle) {
        self = .angle(angle)
    }
}

extension AngleConvertible {

    public static func deg(_ value: Double) -> Self {
        .angle(.deg(value))
    }

    public static func rad(_ value: Double) -> Self {
        .angle(.rad(value))
    }

    public static func grad(_ value: Double) -> Self {
        .angle(.grad(value))
    }

    public static func turn(_ value: Double) -> Self {
        .angle(.turn(value))
    }

    public static func degrees(_ value: Double) -> Self {
        return .angle(.degrees(value))
    }

    public static func gradians(_ value: Double) -> Self {
        return .angle(.gradians(value))
    }

    public static func radians(_ value: Double) -> Self {
        return .angle(.radians(value))
    }
}
