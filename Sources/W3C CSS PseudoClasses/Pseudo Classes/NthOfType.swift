public struct NthOfType: CSSPseudoClass {
    public let description: String

    public init(_ n: Int) {
        self.description = ":nth-of-type(\(n))"
    }

    public init(formula: String) {
        self.description = ":nth-of-type(\(formula))"
    }
}

extension NthOfType {

    public static let odd = NthOfType(formula: "odd")

    public static let even = NthOfType(formula: "even")
}
