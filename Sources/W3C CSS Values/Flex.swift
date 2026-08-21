public struct Flex: Sendable, Hashable {

    public let number: Number

    public init(_ number: Number) {
        self.number = number
    }

    public init(_ number: Int) {
        self.number = .init(number)
    }
}

extension Flex: CustomStringConvertible {

    public var description: String {
        return "\(number)fr"
    }
}

extension Flex: ExpressibleByIntegerLiteral {

    public init(integerLiteral number: IntegerLiteralType) {
        self.init(.init(number))
    }
}

extension Flex: ExpressibleByFloatLiteral {

    public init(floatLiteral number: FloatLiteralType) {
        self.init(Number(number))
    }
}
