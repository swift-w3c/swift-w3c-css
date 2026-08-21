import W3C_CSS_Shared

public struct TypeSelector: Sendable, Hashable {

    private let element: String

    public init(_ element: String) {
        self.element = element.lowercased()
    }
}

extension TypeSelector: CustomStringConvertible {

    public var description: String {
        return element
    }
}
