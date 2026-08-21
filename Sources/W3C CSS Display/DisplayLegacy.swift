public enum DisplayLegacy: String, Sendable, Hashable {

    case inlineBlock = "inline-block"

    case inlineTable = "inline-table"

    case inlineFlex = "inline-flex"

    case inlineGrid = "inline-grid"
}

extension DisplayLegacy: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}
