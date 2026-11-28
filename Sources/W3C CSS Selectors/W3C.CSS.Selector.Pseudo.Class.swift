public import W3C_CSS_Shared

extension W3C.CSS.Selector.Pseudo {
    /// A pseudo-class: a name, and for a functional pseudo-class its argument.
    public struct Class: Sendable, Hashable {
        public var name: String
        public var argument: Argument?

        public init(_ name: String, _ argument: Argument? = nil) {
            self.name = name
            self.argument = argument
        }
    }
}

extension W3C.CSS.Selector.Pseudo.Class {
    public static let root = Self("root")
    public static let empty = Self("empty")
    public static let hover = Self("hover")
    public static let active = Self("active")
    public static let focus = Self("focus")
    public static let focusVisible = Self("focus-visible")
    public static let focusWithin = Self("focus-within")
    public static let target = Self("target")
    public static let enabled = Self("enabled")
    public static let disabled = Self("disabled")
    public static let checked = Self("checked")
    public static let indeterminate = Self("indeterminate")
    public static let placeholderShown = Self("placeholder-shown")
    public static let valid = Self("valid")
    public static let invalid = Self("invalid")
    public static let userValid = Self("user-valid")
    public static let userInvalid = Self("user-invalid")
    public static let required = Self("required")
    public static let optional = Self("optional")
    public static let readOnly = Self("read-only")
    public static let readWrite = Self("read-write")
    public static let anyLink = Self("any-link")
    public static let link = Self("link")
    public static let visited = Self("visited")
    public static let firstChild = Self("first-child")
    public static let lastChild = Self("last-child")
    public static let onlyChild = Self("only-child")
    public static let firstOfType = Self("first-of-type")
    public static let lastOfType = Self("last-of-type")
    public static let onlyOfType = Self("only-of-type")

    public static func not(_ selectors: W3C.CSS.Selector.List) -> Self { Self("not", .selectors(selectors)) }

    public static func `is`(_ selectors: W3C.CSS.Selector.List) -> Self { Self("is", .selectors(selectors)) }

    public static func `where`(_ selectors: W3C.CSS.Selector.List) -> Self { Self("where", .selectors(selectors)) }

    public static func has(_ selectors: [W3C.CSS.Selector.Relative]) -> Self { Self("has", .relative(selectors)) }

    public static func nthChild(_ nth: W3C.CSS.Selector.Nth) -> Self { Self("nth-child", .nth(nth)) }

    public static func nthLastChild(_ nth: W3C.CSS.Selector.Nth) -> Self { Self("nth-last-child", .nth(nth)) }

    public static func nthOfType(_ nth: W3C.CSS.Selector.Nth) -> Self { Self("nth-of-type", .nth(nth)) }

    public static func nthLastOfType(_ nth: W3C.CSS.Selector.Nth) -> Self { Self("nth-last-of-type", .nth(nth)) }
}

extension W3C.CSS.Selector.Pseudo.Class: CustomStringConvertible {
    public var description: String {
        guard let argument else { return ":" + name }
        return ":" + name + "(" + argument.description + ")"
    }
}
