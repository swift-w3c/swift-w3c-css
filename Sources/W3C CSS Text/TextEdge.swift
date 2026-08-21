public enum TextEdge: Sendable, Hashable {

    case single(Value)

    case pair(OverValue, UnderValue)
}

extension TextEdge {

    public enum Value: String, Sendable, Hashable, CaseIterable {

        case text

        case ideographic

        case ideographicInk = "ideographic-ink"
    }

    public enum OverValue: String, Sendable, Hashable, CaseIterable {

        case text

        case ideographic

        case ideographicInk = "ideographic-ink"

        case cap

        case ex
    }

    public enum UnderValue: String, Sendable, Hashable, CaseIterable {

        case text

        case ideographic

        case ideographicInk = "ideographic-ink"

        case alphabetic
    }
}

extension TextEdge {

    public static let text = TextEdge.single(.text)

    public static let ideographic = TextEdge.single(.ideographic)

    public static let ideographicInk = TextEdge.single(.ideographicInk)

    public static let capAlphabetic = TextEdge.pair(.cap, .alphabetic)

    public static let exAlphabetic = TextEdge.pair(.ex, .alphabetic)
}

extension TextEdge: CustomStringConvertible {

    public var description: String {
        switch self {
        case .single(let value):
            return value.rawValue

        case .pair(let overValue, let underValue):
            return "\(overValue.rawValue) \(underValue.rawValue)"
        }
    }
}
