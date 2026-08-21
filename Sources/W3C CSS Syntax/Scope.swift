import W3C_CSS_Shared

public struct Scope: AtRule {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Scope {
    public static let identifier: String = "scope"
}

extension Scope {

    public static func root(_ selector: String) -> Scope {
        Scope(rawValue: "@scope (\(selector)) {}")
    }

    public static func roots(_ selectors: [String]) -> Scope {
        let selectorList = selectors.joined(separator: ", ")
        return Scope(rawValue: "@scope (\(selectorList)) {}")
    }

    public static let inline = Scope(rawValue: "@scope {}")

    public func limit(_ selector: String) -> Scope {
        let currentContent = rawValue
        if currentContent.hasSuffix("{}") {
            let prefix = String(currentContent.dropLast(2))
            return Scope(rawValue: "\(prefix) to (\(selector)) {}")
        }
        return self
    }

    public func style(_ selector: String, _ declarations: String) -> Scope {
        addRule("\(selector) { \(declarations) }")
    }

    public func style(_ selector: String, property: String, value: String) -> Scope {
        addRule("\(selector) { \(property): \(value); }")
    }

    public func rootStyle(property: String, value: String) -> Scope {
        style(":scope", property: property, value: value)
    }

    public func rootStyle(_ declarations: String) -> Scope {
        style(":scope", declarations)
    }

    private func addRule(_ rule: String) -> Scope {
        let currentContent = rawValue

        if currentContent.hasSuffix("{}") {

            let newContent = currentContent.dropLast() + rule + "}"
            return Scope(rawValue: String(newContent))
        } else {

            let newContent = currentContent.dropLast() + " " + rule + "}"
            return Scope(rawValue: String(newContent))
        }
    }
}

extension Scope {

    public func inclusiveLimit(_ selector: String) -> Scope {
        limit("\(selector) > *")
    }

    public static func exclusiveRoot(_ selector: String) -> Scope {
        root("\(selector) > *")
    }

    public static func exclusiveRoot(
        _ rootSelector: String,
        exclusiveLimit limitSelector: String
    ) -> Scope {
        exclusiveRoot(rootSelector).inclusiveLimit(limitSelector)
    }
}
