public struct NthChild: CSSPseudoClass {
    public let description: String

    public init(_ n: Int) {
        self.description = ":nth-child(\(n))"
    }

    public init(formula: String) {
        self.description = ":nth-child(\(formula))"
    }
}

extension NthChild {

    public static let odd = NthChild(formula: "odd")

    public static let even = NthChild(formula: "even")
}
