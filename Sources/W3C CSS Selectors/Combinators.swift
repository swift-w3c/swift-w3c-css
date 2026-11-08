import W3C_CSS_Shared

public struct DescendantCombinator: Sendable, Hashable {

    public init() {}
}

extension DescendantCombinator: CustomStringConvertible {

    public var description: String {
        return " "
    }
}


extension ChildCombinator: CustomStringConvertible {

    public var description: String {
        return " > "
    }
}


extension AdjacentSiblingCombinator: CustomStringConvertible {

    public var description: String {
        return " + "
    }
}


extension GeneralSiblingCombinator: CustomStringConvertible {

    public var description: String {
        return " ~ "
    }
}


extension ColumnCombinator: CustomStringConvertible {

    public var description: String {
        return " || "
    }
}
