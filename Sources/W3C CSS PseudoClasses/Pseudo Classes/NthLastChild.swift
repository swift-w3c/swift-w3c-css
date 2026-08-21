public struct NthLastChild: CSSPseudoClass {
    public let description: String

    public init(_ n: Int) {
        self.description = ":nth-last-child(\(n))"
    }

    public init(formula: String) {
        self.description = ":nth-last-child(\(formula))"
    }
}

extension NthLastChild {

    public static let odd = NthLastChild(formula: "odd")

    public static let even = NthLastChild(formula: "even")
}
