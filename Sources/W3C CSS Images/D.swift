public import W3C_CSS_Shared

public enum D: Property {

    case none

    case path(String)

    case global(Global)
}

extension D {
    public static let property: String = "d"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .path(let pathData):
            return "path(\"\(pathData)\")"

        case .global(let value):
            return value.description
        }
    }
}
