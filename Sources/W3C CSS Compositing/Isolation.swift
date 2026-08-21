public import W3C_CSS_Shared

public enum Isolation: Property {

    case auto

    case isolate

    case global(Global)
}

extension Isolation {
    public static let property: String = "isolation"

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .isolate:
            return "isolate"

        case .global(let global):
            return global.description
        }
    }
}
