import Formatter
public import W3C_CSS_Variables
public import W3C_CSS_Shared

extension W3C.CSS {
    /// A calculation: the tree a math function holds (CSS Values and Units Level 4, section 10).
    public indirect enum Calculation: Sendable, Hashable {
        case length(Double, Length.Unit)
        case percentage(Double)
        case number(Double)
        case environment(Environment, fallback: Calculation?)
        case variable(String)
        /// A custom property with the value to use where it is not set: `var(--name, fallback)`.
        case reference(String, fallback: Calculation)
        case sum(Calculation, Calculation)
        case difference(Calculation, Calculation)
        case product(Calculation, Calculation)
        case quotient(Calculation, Calculation)
        case minimum([Calculation])
        case maximum([Calculation])
        case clamp(minimum: Calculation, preferred: Calculation, maximum: Calculation)
    }
}

extension W3C.CSS.Calculation {
    /// A length, a percentage, a custom property or an earlier calculation as a node of this tree.
    public init?(_ length: Length) {
        switch length {
        case .length(let value, let unit): self = .length(value, unit)
        case .calculation(let calculation): self = calculation
        case .variable(let variable): self = .variable(variable.name)
        case .keyword, .global: return nil
        }
    }

    public init?(_ value: LengthPercentage) {
        switch value {
        case .length(let length): self.init(length)
        case .percentage(let percentage): self = .percentage(percentage.value)
        case .calculation(let calculation): self = calculation
        }
    }

    public static func environment(_ variable: W3C.CSS.Environment) -> Self { .environment(variable, fallback: nil) }
}

extension W3C.CSS.Calculation {
    /// The text of this node as an argument: an operation is written bare, with no `calc()` around it.
    public var argument: String {
        switch self {
        case .length(let value, let unit): "\(value.formatted(Formatter.Number()))\(unit.rawValue)"
        case .percentage(let value): "\(value.formatted(Formatter.Number()))%"
        case .number(let value): "\(value.formatted(Formatter.Number()))"
        case .environment(let variable, let fallback):
            fallback.map { "env(\(variable.rawValue), \($0.argument))" } ?? "env(\(variable.rawValue))"
        case .variable(let name): "var(--\(name))"
        case .reference(let name, let fallback): "var(--\(name), \(fallback.argument))"
        case .sum(let left, let right): "\(left.argument) + \(right.argument)"
        case .difference(let left, let right): "\(left.argument) - \(right.term)"
        case .product(let left, let right): "\(left.term) * \(right.term)"
        case .quotient(let left, let right): "\(left.term) / \(right.term)"
        case .minimum(let values): "min(\(values.map(\.argument).joined(separator: ", ")))"
        case .maximum(let values): "max(\(values.map(\.argument).joined(separator: ", ")))"
        case .clamp(let minimum, let preferred, let maximum):
            "clamp(\(minimum.argument), \(preferred.argument), \(maximum.argument))"
        }
    }

    /// The text of this node as an operand that binds tighter than a sum.
    var term: String {
        switch self {
        case .sum, .difference: "(\(argument))"
        default: argument
        }
    }
}

extension W3C.CSS.Calculation: CustomStringConvertible {
    public var description: String {
        switch self {
        case .sum, .difference, .product, .quotient: "calc(\(argument))"
        default: argument
        }
    }
}

extension W3C.CSS.Calculation {
    /// A typed custom property with the value to use where it is not set.
    public static func variable<Value>(_ variable: W3C.CSS.Variable<Value>, fallback: Self) -> Self {
        .reference(variable.name, fallback: fallback)
    }
}
