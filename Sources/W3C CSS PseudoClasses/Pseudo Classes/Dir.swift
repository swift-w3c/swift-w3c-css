public struct Dir: CSSPseudoClass {
    public let description: String

    public init(_ direction: Direction) {
        self.description = ":dir(\(direction.rawValue))"
    }
}

extension Dir {
}
