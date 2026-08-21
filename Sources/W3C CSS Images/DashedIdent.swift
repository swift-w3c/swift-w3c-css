public struct DashedIdent: Sendable, Hashable {

    private let value: String

    public init(_ value: String) {
        if value.hasPrefix("--") {
            self.value = value
        } else {
            self.value = "--\(value)"
        }
    }

    public init(stringLiteral value: String) {
        self.init(value)
    }
}

extension DashedIdent {

    public static func custom(_ value: String) -> DashedIdent {
        return DashedIdent(value)
    }

    public static func `var`(_ name: DashedIdent) -> String {
        return "var(\(name))"
    }

    public static func `var`(_ name: DashedIdent, fallback: String) -> String {
        return "var(\(name), \(fallback))"
    }
}

extension DashedIdent: ExpressibleByStringLiteral {}

extension DashedIdent: CustomStringConvertible {

    public var description: String {
        return value
    }
}
