public import W3C_CSS_Shared

public enum BoxSizing: Property {

    case contentBox

    case borderBox

    case global(Global)
}

extension BoxSizing {
    public static let property: String = "box-sizing"

    public var description: String {
        switch self {
        case .contentBox:
            return "content-box"

        case .borderBox:
            return "border-box"

        case .global(let global):
            return global.description
        }
    }
}
