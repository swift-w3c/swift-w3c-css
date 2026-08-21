public struct NthLastOfType: CSSPseudoClass {
    public let description: String

    public init(_ n: Int) {
        self.description = ":nth-last-of-type(\(n))"
    }

    public init(formula: String) {
        self.description = ":nth-last-of-type(\(formula))"
    }
}

extension NthLastOfType {

    public static let odd = NthLastOfType(formula: "odd")

    public static let even = NthLastOfType(formula: "even")
}
