public struct CalcSum: Sendable, Hashable {

    private let expression: String

    public init(_ expression: String) {
        self.expression = expression
    }
}

extension CalcSum {

    public static func calc(_ expression: String) -> CalcSum {
        return CalcSum(expression)
    }

    public static func min(_ expressions: String) -> CalcSum {
        return CalcSum("min(\(expressions))")
    }

    public static func max(_ expressions: String) -> CalcSum {
        return CalcSum("max(\(expressions))")
    }

    public static func clamp(min: String, preferred: String, max: String) -> CalcSum {
        return CalcSum("clamp(\(min), \(preferred), \(max))")
    }
}

extension CalcSum: CustomStringConvertible {

    public var description: String {

        if (expression.hasPrefix("min(") && expression.hasSuffix(")"))
            || (expression.hasPrefix("max(") && expression.hasSuffix(")"))
            || (expression.hasPrefix("clamp(") && expression.hasSuffix(")"))
            || (expression.hasPrefix("calc(") && expression.hasSuffix(")"))
        {
            return expression
        }

        return "calc(\(expression))"
    }
}
