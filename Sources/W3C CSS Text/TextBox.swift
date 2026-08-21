public import W3C_CSS_Shared
import W3C_CSS_Values

public enum TextBox: Property {

    case normal

    case trim(TextBoxTrim, TextBoxEdge)

    case global(Global)

    public init(_ trim: TextBoxTrim, _ edge: TextBoxEdge = .auto) {
        self = .trim(trim, edge)
    }
}

extension TextBox {
    public static let property: String = "text-box"
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .trim(let trimValue, let edgeValue):
            return "\(trimValue) \(edgeValue)"

        case .global(let global):
            return global.description
        }
    }
}
