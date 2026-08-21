import W3C_CSS_Shared

public struct AttributeSelector: Sendable, Hashable {

    private let attribute: String

    private let value: String?

    private let `operator`: Operator?

    private let caseInsensitive: Bool

    public init(attribute: String) {
        self.attribute = attribute
        self.value = nil
        self.operator = nil
        self.caseInsensitive = false
    }

    public init(attribute: String, value: String, operator: Operator, caseInsensitive: Bool = false)
    {
        self.attribute = attribute
        self.value = value
        self.operator = `operator`
        self.caseInsensitive = caseInsensitive
    }

}

extension AttributeSelector {

    public enum Operator: String, Sendable, Hashable {

        case equal = "="

        case wordMatch = "~="

        case hyphenMatch = "|="

        case startsWith = "^="

        case endsWith = "$="

        case contains = "*="
    }
}

extension AttributeSelector: CustomStringConvertible {

    public var description: String {
        guard let value, let op = `operator` else {
            return "[\(attribute)]"
        }

        let caseFlag = caseInsensitive ? " i" : ""
        return "[\(attribute)\(op.rawValue)\"\(value)\"\(caseFlag)]"
    }
}
