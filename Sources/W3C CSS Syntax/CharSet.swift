public struct CharSet: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ encoding: String) {
        self.rawValue = "@charset \"\(encoding)\";"
    }

}

extension CharSet {
    public static let identifier: String = "charset"

    public static let utf8 = CharSet("UTF-8")

    public static let utf16 = CharSet("UTF-16")

    public static let latin1 = CharSet("ISO-8859-1")

    public static let latin9 = CharSet("ISO-8859-15")

    public static let windows1252 = CharSet("windows-1252")
}
