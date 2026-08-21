public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextBoxEdge: Property {

    case auto

    case edge(TextEdge.Value)

    case edgePair(TextEdge.OverValue, TextEdge.UnderValue)

    case global(Global)

    public init(_ textEdge: TextEdge) {
        switch textEdge {
        case .single(let value):
            self = .edge(value)

        case .pair(let overValue, let underValue):
            self = .edgePair(overValue, underValue)
        }
    }
}

extension TextBoxEdge {
    public static let property: String = "text-box-edge"

    public static let text = TextBoxEdge.edge(.text)

    public static let ideographic = TextBoxEdge.edge(.ideographic)

    public static let ideographicInk = TextBoxEdge.edge(.ideographicInk)

    public static let capAlphabetic = TextBoxEdge.edgePair(.cap, .alphabetic)

    public static let exAlphabetic = TextBoxEdge.edgePair(.ex, .alphabetic)

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .edge(let value):
            return value.rawValue

        case .edgePair(let overValue, let underValue):
            return "\(overValue.rawValue) \(underValue.rawValue)"

        case .global(let global):
            return global.description
        }
    }
}
