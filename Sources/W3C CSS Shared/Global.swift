public enum Global: String, Sendable, CaseIterable, CustomStringConvertible {

    case inherit

    case initial

    case revert

    case revertLayer = "revert-layer"

    case unset

}

extension Global {
    public var description: String { self.rawValue }
}
