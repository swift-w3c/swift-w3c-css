import W3C_CSS_Shared
public import W3C_CSS_Values

public struct Property: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Property {
    public static let identifier: String = "property"
}

extension Property {

    public static func define(_ name: String) -> Property {
        Property(rawValue: "@property \(name) {}")
    }

    public func syntax(_ value: SyntaxType) -> Property {
        addDescriptor("syntax: \"\(value.rawValue)\"")
    }

    public func syntax(_ customSyntax: String) -> Property {
        addDescriptor("syntax: \"\(customSyntax)\"")
    }

    public func inherits(_ value: Bool) -> Property {
        addDescriptor("inherits: \(value)")
    }

    public func initialValue(_ value: String) -> Property {
        addDescriptor("initial-value: \(value)")
    }

    public func initialValue(_ value: W3C_CSS_Values.Color) -> Property {
        addDescriptor("initial-value: \(value)")
    }

    public func initialValue(_ value: Length) -> Property {
        addDescriptor("initial-value: \(value)")
    }

    public func initialValue(_ value: LengthPercentage) -> Property {
        addDescriptor("initial-value: \(value)")
    }

    private func addDescriptor(_ descriptor: String) -> Property {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + descriptor + ";}"
            return Property(rawValue: String(newContent))
        } else {

            let newContent = currentContent.dropLast() + " " + descriptor + ";}"
            return Property(rawValue: String(newContent))
        }
    }
}

extension Property {

    public enum SyntaxType: String, Hashable, Sendable {

        case universal = "*"

        case color = "<color>"

        case length = "<length>"

        case percentage = "<percentage>"

        case lengthPercentage = "<length-percentage>"

        case number = "<number>"

        case integer = "<integer>"

        case angle = "<angle>"

        case time = "<time>"

        case resolution = "<resolution>"

        case transformFunction = "<transform-function>"

        case customIdent = "<custom-ident>"

        case image = "<image>"

        case url = "<url>"

        case gradient = "<gradient>"
    }
}

extension Property.SyntaxType {

    public static func oneOrMore(_ type: Property.SyntaxType) -> String {
        "\(type.rawValue)+"
    }

    public static func zeroOrMore(_ type: Property.SyntaxType) -> String {
        "\(type.rawValue)*"
    }

    public static func list(_ type: Property.SyntaxType) -> String {
        "\(type.rawValue)#"
    }

    public static func either(_ type1: Property.SyntaxType, _ type2: Property.SyntaxType) -> String
    {
        "\(type1.rawValue) | \(type2.rawValue)"
    }

    public static func any(_ types: Property.SyntaxType...) -> String {
        let typeList = types.map { $0.rawValue }.joined(separator: " | ")
        return "[ \(typeList) ]+"
    }
}
