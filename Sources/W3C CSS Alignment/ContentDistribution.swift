public enum ContentDistribution: String, Sendable, Hashable, CaseIterable {

    case spaceBetween = "space-between"

    case spaceAround = "space-around"

    case spaceEvenly = "space-evenly"

    case stretch
}

extension ContentDistribution: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
