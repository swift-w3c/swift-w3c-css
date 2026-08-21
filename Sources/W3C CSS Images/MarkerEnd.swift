public import W3C_CSS_Shared

public enum MarkerEnd: Property {

    case none

    case url(Url)

    case global(Global)
}

extension MarkerEnd {
    public static let property: String = "marker-end"

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .url(let url):
            return url.description

        case .global(let value):
            return value.description
        }
    }
}

extension MarkerEnd {

    public static func reference(id: String) -> Self {
        .url(Url("#\(id)"))
    }

    public static func externalReference(file: String, id: String) -> Self {
        .url(Url("\(file)#\(id)"))
    }
}
