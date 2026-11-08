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

    // swift-linter:disable:next raw concept
    // REASON: A CSS namespace name, written into the rule as a quoted string and compared as text, never fetched; looked at the url() form, which NamespaceURI already takes, CSSOM's Url, which serializes as url(), and RFC_3986.URI, which would bring swift-rfc-3986 into all of CSS.
    public static func `default`(_ uri: String) -> Namespace {
        Namespace(rawValue: "@namespace \"\(uri)\";")
    }

    public static func prefixed(_ prefix: String, _ uri: NamespaceURI) -> Namespace {
        Namespace(rawValue: "@namespace \(prefix) \(uri.rawValue);")
    }

    // swift-linter:disable:next raw concept
    // REASON: A CSS namespace name, written into the rule as a quoted string and compared as text, never fetched; looked at the url() form, which NamespaceURI already takes, CSSOM's Url, which serializes as url(), and RFC_3986.URI, which would bring swift-rfc-3986 into all of CSS.
    public static func prefixed(_ prefix: String, _ uri: String) -> Namespace {
        Namespace(rawValue: "@namespace \(prefix) \"\(uri)\";")
    }
}

extension Namespace {
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
