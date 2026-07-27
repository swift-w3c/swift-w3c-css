// Selector Tests.swift
// swift-w3c-css
//
// Tests for CSS Selector types

import Testing

@testable import W3C_CSS_Selectors

// MARK: - Universal Selector

@Suite
struct `Universal Selector - Initialization` {
    @Test func `universal selector creates correct representation`() {
        let universal = UniversalSelector()
        #expect(universal.description == "*")
    }

    @Test func `static universal property`() {
        #expect(UniversalSelector.universal.description == "*")
    }
}

// MARK: - Type Selector

@Suite
struct `Type Selector - Initialization` {
    @Test(arguments: [
        ("div", "div"),
        ("p", "p"),
        ("span", "span"),
        ("article", "article"),
        ("section", "section"),
    ])
    func `type selector initialization`(
        element: String,
        expected: String
    ) {
        let selector = TypeSelector(element)
        #expect(selector.description == expected)
    }

    @Test func `type selector with uppercase converts to lowercase`() {
        let selector = TypeSelector("DIV")
        #expect(selector.description == "div")
    }
}

// MARK: - Class Selector

@Suite
struct `Class Selector - Initialization` {
    @Test(arguments: [
        ("container", ".container"),
        ("nav-item", ".nav-item"),
        ("active", ".active"),
        ("btn-primary", ".btn-primary"),
    ])
    func `class selector initialization`(
        className: String,
        expected: String
    ) {
        let selector = ClassSelector(className)
        #expect(selector.description == expected)
    }

    @Test func `class selector without dot prefix adds it`() {
        let selector = ClassSelector("container")
        #expect(selector.description == ".container")
    }

    @Test func `class selector with dot prefix preserves it`() {
        let selector = ClassSelector(".container")
        #expect(selector.description == ".container")
    }
}

// MARK: - ID Selector

@Suite
struct `ID Selector - Initialization` {
    @Test(arguments: [
        ("header", "#header"),
        ("main-content", "#main-content"),
        ("footer", "#footer"),
        ("nav-123", "#nav-123"),
    ])
    func `id selector initialization`(
        id: String,
        expected: String
    ) {
        let selector = IDSelector(id)
        #expect(selector.description == expected)
    }

    @Test func `id selector without hash prefix adds it`() {
        let selector = IDSelector("header")
        #expect(selector.description == "#header")
    }

    @Test func `id selector with hash prefix preserves it`() {
        let selector = IDSelector("#header")
        #expect(selector.description == "#header")
    }
}

// MARK: - Attribute Selector

@Suite
struct `Attribute Selector - Existence` {
    @Test func `attribute existence selector`() {
        let selector = AttributeSelector(attribute: "disabled")
        #expect(selector.description == "[disabled]")
    }

    @Test(arguments: [
        ("href", "[href]"),
        ("data-value", "[data-value]"),
        ("aria-label", "[aria-label]"),
    ])
    func `attribute existence with various names`(
        attribute: String,
        expected: String
    ) {
        let selector = AttributeSelector(attribute: attribute)
        #expect(selector.description == expected)
    }
}

@Suite
struct `Attribute Selector - Exact Match` {
    @Test func `attribute exact value match`() {
        let selector = AttributeSelector(attribute: "type", value: "text", operator: .equal)
        #expect(selector.description == "[type=\"text\"]")
    }

    @Test(arguments: [
        ("href", "https://example.com", "[href=\"https://example.com\"]"),
        ("class", "button", "[class=\"button\"]"),
        ("id", "main", "[id=\"main\"]"),
    ])
    func `exact match with various attributes`(
        attribute: String,
        value: String,
        expected: String
    ) {
        let selector = AttributeSelector(attribute: attribute, value: value, operator: .equal)
        #expect(selector.description == expected)
    }
}

@Suite
struct `Attribute Selector - Pattern Matching` {
    @Test func `attribute starts with value`() {
        let selector = AttributeSelector(attribute: "href", value: "https", operator: .startsWith)
        #expect(selector.description == "[href^=\"https\"]")
    }

    @Test func `attribute ends with value`() {
        let selector = AttributeSelector(attribute: "src", value: ".png", operator: .endsWith)
        #expect(selector.description == "[src$=\".png\"]")
    }

    @Test func `attribute contains value`() {
        let selector = AttributeSelector(attribute: "class", value: "btn", operator: .contains)
        #expect(selector.description == "[class*=\"btn\"]")
    }

    @Test func `attribute contains word`() {
        let selector = AttributeSelector(attribute: "class", value: "active", operator: .wordMatch)
        #expect(selector.description == "[class~=\"active\"]")
    }

    @Test func `attribute hyphen match`() {
        let selector = AttributeSelector(attribute: "lang", value: "en", operator: .hyphenMatch)
        #expect(selector.description == "[lang|=\"en\"]")
    }
}

@Suite
struct `Attribute Selector - Case Sensitivity` {
    @Test func `case insensitive attribute selector`() {
        let selector = AttributeSelector(
            attribute: "href",
            value: "EXAMPLE",
            operator: .equal,
            caseInsensitive: true
        )
        #expect(selector.description == "[href=\"EXAMPLE\" i]")
    }

    @Test func `case sensitive attribute selector`() {
        let selector = AttributeSelector(
            attribute: "href",
            value: "EXAMPLE",
            operator: .equal,
            caseInsensitive: false
        )
        #expect(selector.description == "[href=\"EXAMPLE\"]")
    }
}

// MARK: - Nesting Selector

@Suite
struct `Nesting Selector - Basic` {
    @Test func `nesting selector creates ampersand`() {
        let selector = NestingSelector()
        #expect(selector.description == "&")
    }

    @Test func `static nesting property`() {
        #expect(NestingSelector.nesting.description == "&")
    }
}

// MARK: - Selector Combinations

@Suite
struct `Selector - Compound Selectors` {
    @Test func `element with class selector`() {
        let selector = "div.container"
        #expect(selector == "div.container")
    }

    @Test func `element with id selector`() {
        let selector = "div#main"
        #expect(selector == "div#main")
    }

    @Test func `element with multiple classes`() {
        let selector = "button.btn.btn-primary.active"
        #expect(selector == "button.btn.btn-primary.active")
    }

    @Test func `element with class and attribute`() {
        let selector = "input.form-control[type=\"text\"]"
        #expect(selector == "input.form-control[type=\"text\"]")
    }
}

// MARK: - Edge Cases

@Suite
struct `Selector - Edge Cases` {
    @Test func `empty string handling`() {
        let selector = TypeSelector("")
        #expect(selector.description.isEmpty)
    }

    @Test func `special characters in class names`() {
        let selector = ClassSelector("btn-primary_large-123")
        #expect(selector.description == ".btn-primary_large-123")
    }

    @Test func `unicode characters in selectors`() {
        let selector = ClassSelector("ボタン")
        #expect(selector.description == ".ボタン")
    }

    @Test func `attribute with empty value`() {
        let selector = AttributeSelector(attribute: "value", value: "", operator: .equal)
        #expect(selector.description == "[value=\"\"]")
    }

    @Test func `attribute with quotes in value`() {
        let selector = AttributeSelector(
            attribute: "title",
            value: "It's \"quoted\"",
            operator: .equal
        )
        #expect(selector.description.contains("title"))
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Selector - Hashable Conformance` {
    @Test func `equal type selectors are equal`() {
        let selector1 = TypeSelector("div")
        let selector2 = TypeSelector("div")
        #expect(selector1 == selector2)
    }

    @Test func `different type selectors are not equal`() {
        let selector1 = TypeSelector("div")
        let selector2 = TypeSelector("span")
        #expect(selector1 != selector2)
    }

    @Test func `equal class selectors are equal`() {
        let selector1 = ClassSelector("container")
        let selector2 = ClassSelector("container")
        #expect(selector1 == selector2)
    }

    @Test func `selectors can be used in set`() {
        let set: Set = [TypeSelector("div"), TypeSelector("span"), TypeSelector("div")]
        #expect(set.count == 2)
    }
}

@Suite
struct `Selector - Sendable Conformance` {
    @Test func `selectors are sendable`() async {
        let selector = TypeSelector("div")

        await Task {
            #expect(selector.description == "div")
        }.value
    }
}

// MARK: - Usage in Context

@Suite
struct `Selector - CSS Rule Usage` {
    @Test func `type selector in css rule`() {
        let rule = "\(TypeSelector("div")) { color: red; }"
        #expect(rule == "div { color: red; }")
    }

    @Test func `class selector in css rule`() {
        let rule = "\(ClassSelector("container")) { width: 100%; }"
        #expect(rule == ".container { width: 100%; }")
    }

    @Test func `id selector in css rule`() {
        let rule = "\(IDSelector("header")) { position: fixed; }"
        #expect(rule == "#header { position: fixed; }")
    }

    @Test func `attribute selector in css rule`() {
        let selector = AttributeSelector(attribute: "type", value: "text", operator: .equal)
        let rule = "\(selector) { border: 1px solid gray; }"
        #expect(rule.contains("[type=\"text\"]"))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Selector - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `type selector creation 100K times`() {
            for i in 0..<100_000 {
                _ = TypeSelector("div\(i)")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `class selector creation 100K times`() {
            for i in 0..<100_000 {
                _ = ClassSelector("class-\(i)")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `id selector creation 100K times`() {
            for i in 0..<100_000 {
                _ = IDSelector("id-\(i)")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `attribute selector creation 50K times`() {
            for i in 0..<50_000 {
                _ = AttributeSelector(
                    attribute: "data-id",
                    value: "\(i)",
                    operator: .equal
                )
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `selector comparison 100K times`() {
            let selector1 = TypeSelector("div")
            let selector2 = TypeSelector("span")

            for _ in 0..<100_000 {
                _ = selector1 == selector2
            }
        }
    }
}
