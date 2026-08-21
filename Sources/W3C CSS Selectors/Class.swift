import W3C_CSS_Shared

public struct ClassSelector: Sendable, Hashable {

    private let className: String

    public init(_ className: String) {

        self.className = className.hasPrefix(".") ? String(className.dropFirst()) : className
    }
}

extension ClassSelector: CustomStringConvertible {

    public var description: String {
        return ".\(className)"
    }
}
