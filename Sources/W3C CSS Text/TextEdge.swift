public enum TextEdge: Sendable, Hashable {

    case single(Value)

    case pair(OverValue, UnderValue)
}

extension TextEdge {
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
