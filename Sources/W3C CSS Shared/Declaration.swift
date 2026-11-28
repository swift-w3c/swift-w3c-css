/// One property set to one value (CSS Syntax Module Level 3, section 5.4.6).
public struct Declaration: Sendable, Hashable {

    /// The property's name, a custom property's with its two dashes.
    public let property: String

    public let value: String

    /// Whether the declaration carries `!important` (CSS Cascading Level 4, section 6.4).
    public let isImportant: Bool

    public init(property: String, value: String, isImportant: Bool = false) {
        self.property = property
        self.value = value
        self.isImportant = isImportant
    }
}

extension Declaration: CustomStringConvertible {

    public var description: String {
        property + ":" + value + (isImportant ? "!important" : "")
    }
}
