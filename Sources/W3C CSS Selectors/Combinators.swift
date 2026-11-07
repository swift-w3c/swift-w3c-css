import W3C_CSS_Shared

public struct DescendantCombinator: Sendable, Hashable {

    public init() {}
}

extension DescendantCombinator: CustomStringConvertible {

    public var description: String {
        return " "
    }
}

public struct ChildCombinator: Sendable, Hashable {

    public init() {}
}

extension ChildCombinator: CustomStringConvertible {

    public var description: String {
        return " > "
    }
}

public struct AdjacentSiblingCombinator: Sendable, Hashable {

    public init() {}
}

extension AdjacentSiblingCombinator: CustomStringConvertible {

    public var description: String {
        return " + "
    }
}

public struct GeneralSiblingCombinator: Sendable, Hashable {

    public init() {}
}

extension GeneralSiblingCombinator: CustomStringConvertible {

    public var description: String {
        return " ~ "
    }
}

public struct ColumnCombinator: Sendable, Hashable {

    public init() {}
}

extension ColumnCombinator: CustomStringConvertible {

    public var description: String {
        return " || "
    }
}
