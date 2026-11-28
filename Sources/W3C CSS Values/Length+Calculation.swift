public import W3C_CSS_Shared

extension Length {
    /// The smallest of the given lengths: `min()`.
    public static func min(_ first: Length, _ rest: Length...) -> Length {
        .calculation(.minimum(([first] + rest).map(W3C.CSS.Calculation.operand)))
    }

    /// The largest of the given lengths: `max()`.
    public static func max(_ first: Length, _ rest: Length...) -> Length {
        .calculation(.maximum(([first] + rest).map(W3C.CSS.Calculation.operand)))
    }

    /// The preferred length held between a minimum and a maximum: `clamp()`.
    public static func clamp(_ minimum: Length, _ preferred: Length, _ maximum: Length) -> Length {
        .calculation(.clamp(minimum: .operand(minimum), preferred: .operand(preferred), maximum: .operand(maximum)))
    }

    /// An environment variable, with the length to use where the user agent does not define it: `env()`.
    public static func environment(_ variable: W3C.CSS.Environment, or fallback: Length? = nil) -> Length {
        .calculation(.environment(variable, fallback: fallback.map(W3C.CSS.Calculation.operand)))
    }

    /// A percentage as a term of a length calculation.
    public static func percent(_ value: Double) -> Length {
        .calculation(.percentage(value))
    }
}

extension W3C.CSS.Calculation {
    /// A length as a node; a keyword has no place in a calculation and counts as zero.
    static func operand(_ length: Length) -> Self {
        Self(length) ?? .number(0)
    }
}
