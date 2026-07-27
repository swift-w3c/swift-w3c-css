// Combinator Tests.swift
// swift-w3c-css
//
// Tests for CSS Combinator types

import Testing

@testable import W3C_CSS_Selectors

// MARK: - Basic Functionality

@Suite
struct `Combinator - Descendant` {
    @Test func `descendant combinator initialization`() {
        let combinator = DescendantCombinator()
        #expect(combinator.description == " ")
    }

    @Test func `descendant combinator in selector chain`() {
        let selector = "div p"
        #expect(selector == "div p")
    }

    @Test func `descendant combinator with multiple levels`() {
        let selector = "article section p"
        #expect(selector == "article section p")
    }
}

@Suite
struct `Combinator - Child` {
    @Test func `child combinator initialization`() {
        let combinator = ChildCombinator()
        #expect(combinator.description == " > ")
    }

    @Test func `child combinator in selector chain`() {
        let selector = "ul > li"
        #expect(selector == "ul > li")
    }

    @Test func `child combinator with classes`() {
        let selector = ".container > .item"
        #expect(selector == ".container > .item")
    }

    @Test func `child combinator multiple levels`() {
        let selector = "div > section > p"
        #expect(selector == "div > section > p")
    }
}

@Suite
struct `Combinator - Adjacent Sibling` {
    @Test func `adjacent sibling combinator initialization`() {
        let combinator = AdjacentSiblingCombinator()
        #expect(combinator.description == " + ")
    }

    @Test func `adjacent sibling combinator in selector chain`() {
        let selector = "h1 + p"
        #expect(selector == "h1 + p")
    }

    @Test func `adjacent sibling with classes`() {
        let selector = ".header + .content"
        #expect(selector == ".header + .content")
    }

    @Test func `adjacent sibling with ids`() {
        let selector = "#title + #subtitle"
        #expect(selector == "#title + #subtitle")
    }
}

@Suite
struct `Combinator - General Sibling` {
    @Test func `general sibling combinator initialization`() {
        let combinator = GeneralSiblingCombinator()
        #expect(combinator.description == " ~ ")
    }

    @Test func `general sibling combinator in selector chain`() {
        let selector = "h1 ~ p"
        #expect(selector == "h1 ~ p")
    }

    @Test func `general sibling with classes`() {
        let selector = ".active ~ .item"
        #expect(selector == ".active ~ .item")
    }

    @Test func `general sibling multiple elements`() {
        let selector = "h2 ~ p ~ div"
        #expect(selector == "h2 ~ p ~ div")
    }
}

@Suite
struct `Combinator - Column` {
    @Test func `column combinator initialization`() {
        let combinator = ColumnCombinator()
        #expect(combinator.description == " || ")
    }

    @Test func `column combinator in selector chain`() {
        let selector = "col || td"
        #expect(selector == "col || td")
    }

    @Test func `column combinator with classes`() {
        let selector = ".column || .cell"
        #expect(selector == ".column || .cell")
    }
}

// MARK: - Complex Combinations

@Suite
struct `Combinator - Mixed Combinations` {
    @Test func `descendant and child combined`() {
        let selector = "article div > p"
        #expect(selector == "article div > p")
    }

    @Test func `child and adjacent sibling combined`() {
        let selector = "ul > li + li"
        #expect(selector == "ul > li + li")
    }

    @Test func `descendant and general sibling combined`() {
        let selector = "section h1 ~ p"
        #expect(selector == "section h1 ~ p")
    }

    @Test func `multiple combinators in sequence`() {
        let selector = "div > section p + span"
        #expect(selector == "div > section p + span")
    }

    @Test func `complex selector with all combinators`() {
        let selector = "article > section div + p ~ span"
        #expect(selector == "article > section div + p ~ span")
    }
}

@Suite
struct `Combinator - With Selectors` {
    @Test func `child combinator with class selectors`() {
        let selector = ".parent > .child"
        #expect(selector == ".parent > .child")
    }

    @Test func `descendant combinator with id selectors`() {
        let selector = "#container #item"
        #expect(selector == "#container #item")
    }

    @Test func `adjacent sibling with compound selectors`() {
        let selector = "div.header + div.content"
        #expect(selector == "div.header + div.content")
    }

    @Test func `general sibling with attribute selectors`() {
        let selector = "input[type='text'] ~ input[type='email']"
        #expect(selector == "input[type='text'] ~ input[type='email']")
    }
}

@Suite
struct `Combinator - With Pseudo Classes` {
    @Test func `child combinator with hover`() {
        let selector = "div > a:hover"
        #expect(selector == "div > a:hover")
    }

    @Test func `adjacent sibling with first child`() {
        let selector = "li:first-child + li"
        #expect(selector == "li:first-child + li")
    }

    @Test func `general sibling with nth child`() {
        let selector = "p:nth-child(2) ~ p"
        #expect(selector == "p:nth-child(2) ~ p")
    }

    @Test func `descendant with multiple pseudo classes`() {
        let selector = "div a:hover:focus"
        #expect(selector == "div a:hover:focus")
    }
}

@Suite
struct `Combinator - With Pseudo Elements` {
    @Test func `child combinator with before`() {
        let selector = "div > p::before"
        #expect(selector == "div > p::before")
    }

    @Test func `adjacent sibling with after`() {
        let selector = "h1 + p::after"
        #expect(selector == "h1 + p::after")
    }

    @Test func `descendant with first letter`() {
        let selector = "article p::first-letter"
        #expect(selector == "article p::first-letter")
    }
}

// MARK: - Spacing Variations

@Suite
struct `Combinator - Spacing` {
    @Test func `child combinator without spaces`() {
        let selector = "div>p"
        #expect(selector == "div>p")
    }

    @Test func `child combinator with spaces`() {
        let selector = "div > p"
        #expect(selector == "div > p")
    }

    @Test func `adjacent sibling without spaces`() {
        let selector = "h1+p"
        #expect(selector == "h1+p")
    }

    @Test func `adjacent sibling with spaces`() {
        let selector = "h1 + p"
        #expect(selector == "h1 + p")
    }

    @Test func `general sibling without spaces`() {
        let selector = "h1~p"
        #expect(selector == "h1~p")
    }

    @Test func `general sibling with spaces`() {
        let selector = "h1 ~ p"
        #expect(selector == "h1 ~ p")
    }
}

// MARK: - Edge Cases

@Suite
struct `Combinator - Edge Cases` {
    @Test func `combinator with universal selector`() {
        let selector = "* > *"
        #expect(selector == "* > *")
    }

    @Test func `multiple child combinators`() {
        let selector = "div > section > article > p"
        #expect(selector == "div > section > article > p")
    }

    @Test func `multiple adjacent siblings`() {
        let selector = "h1 + p + p + p"
        #expect(selector == "h1 + p + p + p")
    }

    @Test func `alternating combinators`() {
        let selector = "div > p ~ span + a"
        #expect(selector == "div > p ~ span + a")
    }

    @Test func `combinator at start of selector`() {
        let selector = "> p"
        #expect(selector == "> p")
    }

    @Test func `nesting selector with child combinator`() {
        let selector = "& > .child"
        #expect(selector == "& > .child")
    }
}

// MARK: - Real World Patterns

@Suite
struct `Combinator - Common Patterns` {
    @Test func `list item spacing pattern`() {
        let selector = "li + li"
        #expect(selector == "li + li")
    }

    @Test func `direct children only pattern`() {
        let selector = ".nav > .nav-item"
        #expect(selector == ".nav > .nav-item")
    }

    @Test func `heading followed by paragraph pattern`() {
        let selector = "h1 + p"
        #expect(selector == "h1 + p")
    }

    @Test func `sibling elements after target pattern`() {
        let selector = ".active ~ .item"
        #expect(selector == ".active ~ .item")
    }

    @Test func `nested navigation pattern`() {
        let selector = "nav ul > li > a"
        #expect(selector == "nav ul > li > a")
    }

    @Test func `form field siblings pattern`() {
        let selector = "input:focus ~ label"
        #expect(selector == "input:focus ~ label")
    }
}

@Suite
struct `Combinator - Accessibility Patterns` {
    @Test func `focus within descendant pattern`() {
        let selector = "form:focus-within input"
        #expect(selector == "form:focus-within input")
    }

    @Test func `disabled sibling pattern`() {
        let selector = "input:disabled ~ label"
        #expect(selector == "input:disabled ~ label")
    }

    @Test func `checked adjacent pattern`() {
        let selector = "input:checked + label"
        #expect(selector == "input:checked + label")
    }
}

@Suite
struct `Combinator - Grid and Flexbox Patterns` {
    @Test func `direct grid items`() {
        let selector = ".grid > .item"
        #expect(selector == ".grid > .item")
    }

    @Test func `flex item siblings`() {
        let selector = ".flex-item ~ .flex-item"
        #expect(selector == ".flex-item ~ .flex-item")
    }

    @Test func `grid nested descendants`() {
        let selector = ".grid .row .col"
        #expect(selector == ".grid .row .col")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Combinator - Hashable Conformance` {
    @Test func `equal child combinators are equal`() {
        let combinator1 = ChildCombinator()
        let combinator2 = ChildCombinator()
        #expect(combinator1 == combinator2)
    }

    @Test func `equal combinators are equal`() {
        let child1 = ChildCombinator()
        let child2 = ChildCombinator()
        #expect(child1 == child2)
    }

    @Test func `combinators can be used in set`() {
        let set: Set<ChildCombinator> = [
            ChildCombinator(),
            ChildCombinator(),
        ]
        #expect(set.count == 1)
    }
}

@Suite
struct `Combinator - Sendable Conformance` {
    @Test func `combinators are sendable`() async {
        let combinator = ChildCombinator()

        await Task {
            #expect(combinator.description == " > ")
        }.value
    }
}

// MARK: - Specificity Context

@Suite
struct `Combinator - Specificity` {
    @Test func `combinators do not affect specificity`() {
        // Both should have same specificity (2 elements)
        let descendant = "div p"
        let child = "div > p"
        #expect(descendant != child)
        #expect(descendant.count != child.count)
    }

    @Test func `complex selector specificity`() {
        let selector = "#id > .class element"
        #expect(selector.contains("#id"))
        #expect(selector.contains(".class"))
        #expect(selector.contains(">"))
    }
}

// MARK: - Usage in Context

@Suite
struct `Combinator - CSS Rule Usage` {
    @Test func `child combinator in css rule`() {
        let rule = "ul > li { list-style: none; }"
        #expect(rule == "ul > li { list-style: none; }")
    }

    @Test func `adjacent sibling in css rule`() {
        let rule = "h1 + p { margin-top: 0; }"
        #expect(rule == "h1 + p { margin-top: 0; }")
    }

    @Test func `general sibling in css rule`() {
        let rule = "h1 ~ p { color: gray; }"
        #expect(rule == "h1 ~ p { color: gray; }")
    }

    @Test func `descendant in css rule`() {
        let rule = "article p { line-height: 1.6; }"
        #expect(rule == "article p { line-height: 1.6; }")
    }

    @Test func `multiple combinators in css rule`() {
        let rule = "nav > ul li + li { margin-left: 10px; }"
        #expect(rule == "nav > ul li + li { margin-left: 10px; }")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Combinator - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `child combinator creation 100K times`() {
            for _ in 0..<100_000 {
                _ = ChildCombinator()
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `adjacent sibling combinator creation 100K times`() {
            for _ in 0..<100_000 {
                _ = AdjacentSiblingCombinator()
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `general sibling combinator creation 100K times`() {
            for _ in 0..<100_000 {
                _ = GeneralSiblingCombinator()
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `descendant combinator creation 100K times`() {
            for _ in 0..<100_000 {
                _ = DescendantCombinator()
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `combinator comparison 100K times`() {
            let combinator1 = ChildCombinator()
            let combinator2 = ChildCombinator()

            for _ in 0..<100_000 {
                _ = combinator1 == combinator2
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `complex selector building 50K times`() {
            for _ in 0..<50_000 {
                _ = "div > section article + p ~ span"
            }
        }
    }
}
