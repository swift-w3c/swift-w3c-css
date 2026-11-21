public import W3C_CSS_Shared

public enum MarkerStart: Property {

    case none

    case url(W3C.CSSOM.Url)

    case global(Global)
}

extension MarkerStart {
    public static let property: String = "marker-start"

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

extension MarkerStart {

    public static func reference(id: String) -> Self {
        .url(W3C.CSSOM.Url("#\(id)"))
    }

    public static func externalReference(file: W3C.CSSOM.Url, id: String) -> Self {
        .url(W3C.CSSOM.Url("\(file.value)#\(id)"))
    }
}
