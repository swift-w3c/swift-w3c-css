import W3C_CSS_Shared

public struct Namespace: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Namespace {
    public static let identifier: String = "namespace"
}

extension Namespace {

    public static func `default`(_ uri: NamespaceURI) -> Namespace {
        Namespace(rawValue: "@namespace \(uri.rawValue);")
    }

    public static func `default`(_ uri: String) -> Namespace {
        Namespace(rawValue: "@namespace \"\(uri)\";")
    }

    public static func prefixed(_ prefix: String, _ uri: NamespaceURI) -> Namespace {
        Namespace(rawValue: "@namespace \(prefix) \(uri.rawValue);")
    }

    public static func prefixed(_ prefix: String, _ uri: String) -> Namespace {
        Namespace(rawValue: "@namespace \(prefix) \"\(uri)\";")
    }
}

extension Namespace {

    public enum NamespaceURI: Hashable, Sendable {

        case url(String)
    }

    public struct CommonNamespaces {
    }
}

extension Namespace.NamespaceURI {

    public var rawValue: String {
        switch self {
        case .url(let url):
            return "url(\(url))"
        }
    }
}

extension Namespace.CommonNamespaces {

    public static let xhtml = "http://www.w3.org/1999/xhtml"

    public static let svg = "http://www.w3.org/2000/svg"

    public static let mathML = "http://www.w3.org/1998/Math/MathML"

    public static let xlink = "http://www.w3.org/1999/xlink"
}
