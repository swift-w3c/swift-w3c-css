public struct Integer: Sendable, Hashable {

    public let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}

extension Integer {

    public static let zero = Integer(0)

    public static let one = Integer(1)
}

extension Integer: CustomStringConvertible {

    public var description: String {
        return "\(value)"
    }
}

extension Integer: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

extension Integer {

    public static func < (lhs: Integer, rhs: Integer) -> Bool {
        return lhs.value < rhs.value
    }

    public static func + (lhs: Integer, rhs: Integer) -> Integer {
        return Integer(lhs.value + rhs.value)
    }

    public static func - (lhs: Integer, rhs: Integer) -> Integer {
        return Integer(lhs.value - rhs.value)
    }

    public static prefix func - (operand: Integer) -> Integer {
        return Integer(-operand.value)
    }

    public var absolute: Integer {
        return Integer(abs(value))
    }
}
