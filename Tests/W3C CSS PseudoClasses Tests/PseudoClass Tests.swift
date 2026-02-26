// PseudoClass Tests.swift
// swift-w3c-css
//
// Tests for CSS PseudoClass types

import Testing

@testable import W3C_CSS_PseudoClasses

// MARK: - Basic Functionality

@Suite
struct `PseudoClass - Basic Initialization` {
    @Test func `hover pseudo class`() {
        let hover = Hover()
        #expect(hover.description == ":hover")
    }

    @Test func `active pseudo class`() {
        let active = Active()
        #expect(active.description == ":active")
    }

    @Test func `focus pseudo class`() {
        let focus = Focus()
        #expect(focus.description == ":focus")
    }

    @Test func `visited pseudo class`() {
        let visited = Visited()
        #expect(visited.description == ":visited")
    }

    @Test func `link pseudo class`() {
        let link = Link()
        #expect(link.description == ":link")
    }
}

@Suite
struct `PseudoClass - Structural` {
    @Test func `first child pseudo class`() {
        let firstChild = FirstChild()
        #expect(firstChild.description == ":first-child")
    }

    @Test func `last child pseudo class`() {
        let lastChild = LastChild()
        #expect(lastChild.description == ":last-child")
    }

    @Test func `only child pseudo class`() {
        let onlyChild = OnlyChild()
        #expect(onlyChild.description == ":only-child")
    }

    @Test func `first of type pseudo class`() {
        let firstOfType = FirstOfType()
        #expect(firstOfType.description == ":first-of-type")
    }

    @Test func `last of type pseudo class`() {
        let lastOfType = LastOfType()
        #expect(lastOfType.description == ":last-of-type")
    }

    @Test func `only of type pseudo class`() {
        let onlyOfType = OnlyOfType()
        #expect(onlyOfType.description == ":only-of-type")
    }
}

@Suite
struct `PseudoClass - Nth Child` {
    @Test(arguments: [
        (1, ":nth-child(1)"),
        (2, ":nth-child(2)"),
        (5, ":nth-child(5)"),
        (10, ":nth-child(10)"),
    ])
    func `nth child with numeric value`(
        n: Int,
        expected: String
    ) {
        let nthChild = NthChild(n)
        #expect(nthChild.description == expected)
    }

    @Test func `nth child with odd keyword`() {
        let nthChild = NthChild.odd
        #expect(nthChild.description == ":nth-child(odd)")
    }

    @Test func `nth child with even keyword`() {
        let nthChild = NthChild.even
        #expect(nthChild.description == ":nth-child(even)")
    }

    @Test(arguments: [
        ("2n", ":nth-child(2n)"),
        ("2n+1", ":nth-child(2n+1)"),
        ("3n", ":nth-child(3n)"),
        ("-n+3", ":nth-child(-n+3)"),
    ])
    func `nth child with formula`(
        formula: String,
        expected: String
    ) {
        let nthChild = NthChild(formula: formula)
        #expect(nthChild.description == expected)
    }
}

@Suite
struct `PseudoClass - Nth Last Child` {
    @Test(arguments: [
        (1, ":nth-last-child(1)"),
        (2, ":nth-last-child(2)"),
        (3, ":nth-last-child(3)"),
    ])
    func `nth last child with numeric value`(
        n: Int,
        expected: String
    ) {
        let nthLastChild = NthLastChild(n)
        #expect(nthLastChild.description == expected)
    }

    @Test func `nth last child with odd keyword`() {
        let nthLastChild = NthLastChild.odd
        #expect(nthLastChild.description == ":nth-last-child(odd)")
    }

    @Test func `nth last child with even keyword`() {
        let nthLastChild = NthLastChild.even
        #expect(nthLastChild.description == ":nth-last-child(even)")
    }
}

@Suite
struct `PseudoClass - Nth Of Type` {
    @Test(arguments: [
        (1, ":nth-of-type(1)"),
        (2, ":nth-of-type(2)"),
        (5, ":nth-of-type(5)"),
    ])
    func `nth of type with numeric value`(
        n: Int,
        expected: String
    ) {
        let nthOfType = NthOfType(n)
        #expect(nthOfType.description == expected)
    }

    @Test func `nth of type with odd keyword`() {
        let nthOfType = NthOfType.odd
        #expect(nthOfType.description == ":nth-of-type(odd)")
    }

    @Test func `nth of type with even keyword`() {
        let nthOfType = NthOfType.even
        #expect(nthOfType.description == ":nth-of-type(even)")
    }
}

@Suite
struct `PseudoClass - Nth Last Of Type` {
    @Test(arguments: [
        (1, ":nth-last-of-type(1)"),
        (2, ":nth-last-of-type(2)"),
        (3, ":nth-last-of-type(3)"),
    ])
    func `nth last of type with numeric value`(
        n: Int,
        expected: String
    ) {
        let nthLastOfType = NthLastOfType(n)
        #expect(nthLastOfType.description == expected)
    }

    @Test func `nth last of type with odd keyword`() {
        let nthLastOfType = NthLastOfType.odd
        #expect(nthLastOfType.description == ":nth-last-of-type(odd)")
    }

    @Test func `nth last of type with even keyword`() {
        let nthLastOfType = NthLastOfType.even
        #expect(nthLastOfType.description == ":nth-last-of-type(even)")
    }
}

// MARK: - Form States

@Suite
struct `PseudoClass - Form States` {
    @Test func `checked pseudo class`() {
        let checked = Checked()
        #expect(checked.description == ":checked")
    }

    @Test func `disabled pseudo class`() {
        let disabled = Disabled()
        #expect(disabled.description == ":disabled")
    }

    @Test func `enabled pseudo class`() {
        let enabled = Enabled()
        #expect(enabled.description == ":enabled")
    }

    @Test func `required pseudo class`() {
        let required = Required()
        #expect(required.description == ":required")
    }

    @Test func `optional pseudo class`() {
        let optional = Optional()
        #expect(optional.description == ":optional")
    }

    @Test func `read only pseudo class`() {
        let readOnly = ReadOnly()
        #expect(readOnly.description == ":read-only")
    }

    @Test func `read write pseudo class`() {
        let readWrite = ReadWrite()
        #expect(readWrite.description == ":read-write")
    }

    @Test func `placeholder shown pseudo class`() {
        let placeholderShown = PlaceholderShown()
        #expect(placeholderShown.description == ":placeholder-shown")
    }
}

@Suite
struct `PseudoClass - Validation States` {
    @Test func `valid pseudo class`() {
        let valid = Valid()
        #expect(valid.description == ":valid")
    }

    @Test func `invalid pseudo class`() {
        let invalid = Invalid()
        #expect(invalid.description == ":invalid")
    }

    @Test func `in range pseudo class`() {
        let inRange = InRange()
        #expect(inRange.description == ":in-range")
    }

    @Test func `out of range pseudo class`() {
        let outOfRange = OutOfRange()
        #expect(outOfRange.description == ":out-of-range")
    }
}

// MARK: - UI States

@Suite
struct `PseudoClass - UI States` {
    @Test func `default pseudo class`() {
        let defaultState = Default()
        #expect(defaultState.description == ":default")
    }

    @Test func `indeterminate pseudo class`() {
        let indeterminate = Indeterminate()
        #expect(indeterminate.description == ":indeterminate")
    }

    @Test func `blank pseudo class`() {
        let blank = Blank()
        #expect(blank.description == ":blank")
    }

    @Test func `empty pseudo class`() {
        let empty = Empty()
        #expect(empty.description == ":empty")
    }
}

// MARK: - Logical Pseudo Classes

@Suite
struct `PseudoClass - Not` {
    @Test func `not pseudo class with class selector`() {
        let not = Not(".disabled")
        #expect(not.description == ":not(.disabled)")
    }

    @Test func `not pseudo class with id selector`() {
        let not = Not("#header")
        #expect(not.description == ":not(#header)")
    }

    @Test func `not pseudo class with element selector`() {
        let not = Not("div")
        #expect(not.description == ":not(div)")
    }

    @Test func `not pseudo class with attribute selector`() {
        let not = Not("[disabled]")
        #expect(not.description == ":not([disabled])")
    }
}

@Suite
struct `PseudoClass - Is` {
    @Test func `is pseudo class with single selector`() {
        let `is` = Is("div")
        #expect(`is`.description == ":is(div)")
    }

    @Test func `is pseudo class with multiple selectors`() {
        let `is` = Is("div, p, span")
        #expect(`is`.description == ":is(div, p, span)")
    }
}

@Suite
struct `PseudoClass - Where` {
    @Test func `where pseudo class with single selector`() {
        let whereClause = Where("div")
        #expect(whereClause.description == ":where(div)")
    }

    @Test func `where pseudo class with multiple selectors`() {
        let whereClause = Where("div, p, span")
        #expect(whereClause.description == ":where(div, p, span)")
    }
}

@Suite
struct `PseudoClass - Has` {
    @Test func `has pseudo class with child selector`() {
        let has = Has("img")
        #expect(has.description == ":has(img)")
    }

    @Test func `has pseudo class with descendant selector`() {
        let has = Has(".active")
        #expect(has.description == ":has(.active)")
    }

    @Test func `has pseudo class with complex selector`() {
        let has = Has("> .child")
        #expect(has.description == ":has(> .child)")
    }
}

// MARK: - Location Pseudo Classes

@Suite
struct `PseudoClass - Location` {
    @Test func `target pseudo class`() {
        let target = Target()
        #expect(target.description == ":target")
    }

    @Test func `any link pseudo class`() {
        let anyLink = AnyLink()
        #expect(anyLink.description == ":any-link")
    }

    @Test func `local link pseudo class`() {
        let localLink = LocalLink()
        #expect(localLink.description == ":local-link")
    }

    @Test func `target within pseudo class`() {
        let targetWithin = TargetWithin()
        #expect(targetWithin.description == ":target-within")
    }
}

// MARK: - User Action Pseudo Classes

@Suite
struct `PseudoClass - User Actions` {
    @Test func `focus visible pseudo class`() {
        let focusVisible = FocusVisible()
        #expect(focusVisible.description == ":focus-visible")
    }

    @Test func `focus within pseudo class`() {
        let focusWithin = FocusWithin()
        #expect(focusWithin.description == ":focus-within")
    }
}

// MARK: - Root and Scope

@Suite
struct `PseudoClass - Document Structure` {
    @Test func `root pseudo class`() {
        let root = Root()
        #expect(root.description == ":root")
    }

    @Test func `scope pseudo class`() {
        let scope = Scope()
        #expect(scope.description == ":scope")
    }
}

// MARK: - Language

@Suite
struct `PseudoClass - Language` {
    @Test(arguments: [
        ("en", ":lang(en)"),
        ("fr", ":lang(fr)"),
        ("de", ":lang(de)"),
        ("ja", ":lang(ja)"),
    ])
    func `lang pseudo class with language code`(
        lang: String,
        expected: String
    ) {
        let language = Lang(lang)
        #expect(language.description == expected)
    }

    @Test func `lang pseudo class with region code`() {
        let language = Lang("en-US")
        #expect(language.description == ":lang(en-US)")
    }
}

// MARK: - Directionality

@Suite
struct `PseudoClass - Directionality` {
    @Test func `dir ltr pseudo class`() {
        let dir = Dir(.ltr)
        #expect(dir.description == ":dir(ltr)")
    }

    @Test func `dir rtl pseudo class`() {
        let dir = Dir(.rtl)
        #expect(dir.description == ":dir(rtl)")
    }
}

// MARK: - Edge Cases

@Suite
struct `PseudoClass - Edge Cases` {
    @Test func `nth child with zero`() {
        let nthChild = NthChild(0)
        #expect(nthChild.description == ":nth-child(0)")
    }

    @Test func `nth child with negative`() {
        let nthChild = NthChild(-1)
        #expect(nthChild.description == ":nth-child(-1)")
    }

    @Test func `empty lang code`() {
        let language = Lang("")
        #expect(language.description == ":lang()")
    }

    @Test func `not with empty selector`() {
        let not = Not("")
        #expect(not.description == ":not()")
    }

    @Test func `complex formula in nth child`() {
        let nthChild = NthChild(formula: "3n+2")
        #expect(nthChild.description == ":nth-child(3n+2)")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `PseudoClass - Hashable Conformance` {
    @Test func `equal pseudo classes are equal`() {
        let hover1 = Hover()
        let hover2 = Hover()
        #expect(hover1 == hover2)
    }

    @Test func `pseudo classes can be used in set`() {
        let set: Set<Hover> = [Hover(), Hover()]
        #expect(set.count == 1)
    }
}

@Suite
struct `PseudoClass - Sendable Conformance` {
    @Test func `pseudo classes are sendable`() async {
        let hover = Hover()

        await Task {
            #expect(hover.description == ":hover")
        }.value
    }
}

// MARK: - Usage in Context

@Suite
struct `PseudoClass - CSS Rule Usage` {
    @Test func `hover in css rule`() {
        let rule = "a\(Hover()) { color: blue; }"
        #expect(rule == "a:hover { color: blue; }")
    }

    @Test func `first child in css rule`() {
        let rule = "li\(FirstChild()) { margin-top: 0; }"
        #expect(rule == "li:first-child { margin-top: 0; }")
    }

    @Test func `nth child in css rule`() {
        let rule = "tr\(NthChild(2)) { background: gray; }"
        #expect(rule == "tr:nth-child(2) { background: gray; }")
    }

    @Test func `not in css rule`() {
        let rule = "input\(Not("[type='submit']")) { border: 1px solid; }"
        #expect(rule == "input:not([type='submit']) { border: 1px solid; }")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `PseudoClass - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `simple pseudo class creation 100K times`() {
            for _ in 0..<100_000 {
                _ = Hover()
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `nth child creation 100K times`() {
            for i in 0..<100_000 {
                _ = NthChild(i)
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `not pseudo class creation 50K times`() {
            for i in 0..<50_000 {
                _ = Not(".class-\(i)")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `lang pseudo class creation 50K times`() {
            for _ in 0..<50_000 {
                _ = Lang("en")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `pseudo class comparison 100K times`() {
            let hover1 = Hover()
            let hover2 = Hover()

            for _ in 0..<100_000 {
                _ = hover1 == hover2
            }
        }
    }
}
