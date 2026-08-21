import W3C_CSS_Shared

public struct IDSelector: Sendable, Hashable {

    private let id: String

    public init(_ id: String) {

        self.id = id.hasPrefix("#") ? String(id.dropFirst()) : id
    }
}

extension IDSelector: CustomStringConvertible {

    public var description: String {
        return "#\(id)"
    }
}
