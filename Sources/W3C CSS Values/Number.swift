import Format_Primitives
import IEEE_754

public struct Number: Sendable, Hashable {

    public let value: Double

    public init(_ value: Double) {
        self.value = value
    }

    public init(_ value: Int) {
        self.value = Double(value)
    }
}

extension Number {

    public static let zero = Number(0)

    public static let one = Number(1)
}

extension Number: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    public init(integerLiteral value: Int) {
        self.init(value)
    }

    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

extension Number {

    @_disfavoredOverload
    public static func < (lhs: Number, rhs: Number) -> Bool {
        return lhs.value < rhs.value
    }

    @_disfavoredOverload
    public static func > (lhs: Number, rhs: Number) -> Bool {
        return lhs.value > rhs.value
    }

    @_disfavoredOverload
    public static func + (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value + rhs.value)
    }

    @_disfavoredOverload
    public static func - (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value - rhs.value)
    }

    @_disfavoredOverload
    public static func * (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value * rhs.value)
    }

    @_disfavoredOverload
    public static func / (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value / rhs.value)
    }

    @_disfavoredOverload
    public static prefix func - (operand: Number) -> Number {
        return Number(-operand.value)
    }

    public var absolute: Number {
        return Number(abs(value))
    }

    public var rounded: Number {
        return Number(value.rounded())
    }

    public var floor: Number {
        return Number(value.rounded(.down))
    }

    public var ceil: Number {
        return Number(value.rounded(.up))
    }
}

extension Number: CustomStringConvertible {

    public var description: String {
        return value.formatted(.number)
    }
}
