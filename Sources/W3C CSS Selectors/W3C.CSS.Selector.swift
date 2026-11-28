public import W3C_CSS_Shared

extension W3C.CSS {
    /// A complex selector: compound selectors joined by combinators (Selectors Level 4, section 3.1).
    public struct Selector: Sendable, Hashable {
        public var head: Compound
        public var tail: [Step]

        public init(_ head: Compound, _ tail: [Step] = []) {
            self.head = head
            self.tail = tail
        }
    }
}

extension W3C.CSS.Selector {
    public static let universal = Self(.init([.universal]))

    public static let nesting = Self(.init([.nesting]))

    public static func type(_ name: String) -> Self { Self(.init([.type(name)])) }

    public static func `class`(_ name: String) -> Self { Self(.init([.class(name)])) }

    public static func `class`<Name: RawRepresentable>(_ name: Name) -> Self where Name.RawValue == String {
        .class(name.rawValue)
    }

    public static func id(_ name: String) -> Self { Self(.init([.id(name)])) }

    public static func attribute(_ attribute: AttributeSelector) -> Self { Self(.init([.attribute(attribute)])) }

    public static func attribute(_ name: String) -> Self { .attribute(.init(attribute: name)) }

    public static func attribute(_ name: String, _ match: AttributeSelector.Operator, _ value: String) -> Self {
        .attribute(.init(attribute: name, value: value, operator: match))
    }

    public static func pseudo(_ pseudo: Pseudo.Class) -> Self { Self(.init([.pseudoClass(pseudo)])) }
}

extension W3C.CSS.Selector {
    /// Appends a simple selector to the last compound selector.
    public func and(_ simple: Simple) -> Self {
        var copy = self
        if copy.tail.isEmpty {
            copy.head.parts.append(simple)
        } else {
            copy.tail[copy.tail.count - 1].compound.parts.append(simple)
        }
        return copy
    }

    public func `class`(_ name: String) -> Self { and(.class(name)) }

    public func `class`<Name: RawRepresentable>(_ name: Name) -> Self where Name.RawValue == String {
        and(.class(name.rawValue))
    }

    public func id(_ name: String) -> Self { and(.id(name)) }

    public func attribute(_ attribute: AttributeSelector) -> Self { and(.attribute(attribute)) }

    public func attribute(_ name: String) -> Self { and(.attribute(.init(attribute: name))) }

    public func attribute(_ name: String, _ match: AttributeSelector.Operator, _ value: String) -> Self {
        and(.attribute(.init(attribute: name, value: value, operator: match)))
    }

    public func pseudo(_ pseudo: Pseudo.Class) -> Self { and(.pseudoClass(pseudo)) }

    public func pseudo(_ pseudo: Pseudo.Element) -> Self { and(.pseudoElement(pseudo)) }

    public func not(_ selectors: Self...) -> Self { pseudo(.not(.init(selectors))) }

    public func `is`(_ selectors: Self...) -> Self { pseudo(.is(.init(selectors))) }

    public func `where`(_ selectors: Self...) -> Self { pseudo(.where(.init(selectors))) }

    public func has(_ selectors: Relative...) -> Self { pseudo(.has(selectors)) }
}

extension W3C.CSS.Selector {
    public func joined(_ combinator: Combinator, _ other: Self) -> Self {
        var copy = self
        copy.tail.append(.init(combinator, other.head))
        copy.tail.append(contentsOf: other.tail)
        return copy
    }

    public func descendant(_ other: Self) -> Self { joined(.descendant, other) }

    public func child(_ other: Self) -> Self { joined(.child, other) }

    public func next(_ other: Self) -> Self { joined(.next, other) }

    public func subsequent(_ other: Self) -> Self { joined(.subsequent, other) }
}

extension W3C.CSS.Selector: CustomStringConvertible {
    public var description: String {
        tail.reduce(into: head.description) { $0 += $1.combinator.description + $1.compound.description }
    }
}
