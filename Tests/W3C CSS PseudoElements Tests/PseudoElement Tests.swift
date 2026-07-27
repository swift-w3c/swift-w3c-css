// PseudoElement Tests.swift
// swift-w3c-css
//
// Tests for CSS PseudoElement types

import Testing

@testable import W3C_CSS_PseudoElements

// MARK: - Basic Functionality

@Suite
struct `PseudoElement - Generated Content` {
    @Test func `before pseudo element`() {
        let before = Before()
        #expect(before.description == "::before")
    }

    @Test func `after pseudo element`() {
        let after = After()
        #expect(after.description == "::after")
    }
}

@Suite
struct `PseudoElement - Typographic` {
    @Test func `first line pseudo element`() {
        let firstLine = FirstLine()
        #expect(firstLine.description == "::first-line")
    }

    @Test func `first letter pseudo element`() {
        let firstLetter = FirstLetter()
        #expect(firstLetter.description == "::first-letter")
    }
}

@Suite
struct `PseudoElement - Selection` {
    @Test func `selection pseudo element`() {
        let selection = Selection()
        #expect(selection.description == "::selection")
    }
}

@Suite
struct `PseudoElement - Form Elements` {
    @Test func `placeholder pseudo element`() {
        let placeholder = Placeholder()
        #expect(placeholder.description == "::placeholder")
    }

    @Test func `file selector button pseudo element`() {
        let fileSelectorButton = FileSelectorButton()
        #expect(fileSelectorButton.description == "::file-selector-button")
    }
}

@Suite
struct `PseudoElement - List Markers` {
    @Test func `marker pseudo element`() {
        let marker = Marker()
        #expect(marker.description == "::marker")
    }
}

@Suite
struct `PseudoElement - Dialog and Fullscreen` {
    @Test func `backdrop pseudo element`() {
        let backdrop = Backdrop()
        #expect(backdrop.description == "::backdrop")
    }
}

@Suite
struct `PseudoElement - Text Fragments` {
    @Test func `target text pseudo element`() {
        let targetText = TargetText()
        #expect(targetText.description == "::target-text")
    }

    @Test func `spelling error pseudo element`() {
        let spellingError = SpellingError()
        #expect(spellingError.description == "::spelling-error")
    }

    @Test func `grammar error pseudo element`() {
        let grammarError = GrammarError()
        #expect(grammarError.description == "::grammar-error")
    }
}

@Suite
struct `PseudoElement - Highlight` {
    @Test func `highlight pseudo element with default`() {
        let highlight = Highlight()
        #expect(highlight.description == "::highlight")
    }

    @Test(arguments: [
        ("search-result", "::highlight(search-result)"),
        ("custom-highlight", "::highlight(custom-highlight)"),
        ("note", "::highlight(note)"),
    ])
    func `highlight pseudo element with name`(
        name: String,
        expected: String
    ) {
        let highlight = Highlight(name)
        #expect(highlight.description == expected)
    }
}

// MARK: - Web Components

@Suite
struct `PseudoElement - Shadow DOM` {
    @Test(arguments: [
        ("button", "::part(button)"),
        ("container", "::part(container)"),
        ("header", "::part(header)"),
    ])
    func `part pseudo element`(
        part: String,
        expected: String
    ) {
        let partElement = Part(part)
        #expect(partElement.description == expected)
    }

    @Test func `slotted pseudo element with element selector`() {
        let slotted = Slotted("div")
        #expect(slotted.description == "::slotted(div)")
    }

    @Test func `slotted pseudo element with class selector`() {
        let slotted = Slotted(".item")
        #expect(slotted.description == "::slotted(.item)")
    }

    @Test func `slotted pseudo element with universal selector`() {
        let slotted = Slotted("*")
        #expect(slotted.description == "::slotted(*)")
    }
}

// MARK: - Media Elements

@Suite
struct `PseudoElement - Media` {
    @Test func `cue pseudo element without selector`() {
        let cue = Cue()
        #expect(cue.description == "::cue")
    }

    @Test(arguments: [
        ("v[voice=\"announcer\"]", "::cue(v[voice=\"announcer\"])"),
        (".speaker", "::cue(.speaker)"),
    ])
    func `cue pseudo element with selector`(
        selector: String,
        expected: String
    ) {
        let cue = Cue(selector)
        #expect(cue.description == expected)
    }
}

// MARK: - Experimental and Upcoming

@Suite
struct `PseudoElement - Experimental` {
    @Test func `details content pseudo element`() {
        let detailsContent = DetailsContent()
        #expect(detailsContent.description == "::details-content")
    }

    @Test func `checkmark pseudo element`() {
        let checkmark = Checkmark()
        #expect(checkmark.description == "::checkmark")
    }

    @Test func `column pseudo element`() {
        let column = Column()
        #expect(column.description == "::column")
    }
}

// MARK: - Double vs Single Colon

@Suite
struct `PseudoElement - Syntax Variants` {
    @Test func `before uses double colon`() {
        let before = Before()
        #expect(before.description.hasPrefix("::"))
    }

    @Test func `after uses double colon`() {
        let after = After()
        #expect(after.description.hasPrefix("::"))
    }

    @Test func `first line uses double colon`() {
        let firstLine = FirstLine()
        #expect(firstLine.description.hasPrefix("::"))
    }

    @Test func `first letter uses double colon`() {
        let firstLetter = FirstLetter()
        #expect(firstLetter.description.hasPrefix("::"))
    }
}

// MARK: - Edge Cases

@Suite
struct `PseudoElement - Edge Cases` {
    @Test func `empty part name`() {
        let part = Part("")
        #expect(part.description == "::part()")
    }

    @Test func `empty highlight name`() {
        let highlight = Highlight("")
        #expect(highlight.description == "::highlight()")
    }

    @Test func `empty slotted selector`() {
        let slotted = Slotted("")
        #expect(slotted.description == "::slotted()")
    }

    @Test func `part with special characters`() {
        let part = Part("btn-primary_123")
        #expect(part.description == "::part(btn-primary_123)")
    }

    @Test func `highlight with hyphenated name`() {
        let highlight = Highlight("search-results-highlight")
        #expect(highlight.description == "::highlight(search-results-highlight)")
    }

    @Test func `cue with complex selector`() {
        let cue = Cue(".speaker[data-active='true']")
        #expect(cue.description == "::cue(.speaker[data-active='true'])")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `PseudoElement - Hashable Conformance` {
    @Test func `equal pseudo elements are equal`() {
        let before1 = Before()
        let before2 = Before()
        #expect(before1 == before2)
    }

    @Test func `different pseudo elements are not equal`() {
        let before = AnyPseudoElement(Before())
        let after = AnyPseudoElement(After())
        #expect(before != after)
    }

    @Test func `pseudo elements with same parameter are equal`() {
        let part1 = Part("button")
        let part2 = Part("button")
        #expect(part1 == part2)
    }

    @Test func `pseudo elements with different parameters are not equal`() {
        let part1 = Part("button")
        let part2 = Part("container")
        #expect(part1 != part2)
    }

    @Test func `pseudo elements can be used in set`() {
        let set: Set<AnyPseudoElement> = [
            AnyPseudoElement(Before()), AnyPseudoElement(After()), AnyPseudoElement(Before()),
        ]
        #expect(set.count == 2)
    }
}

@Suite
struct `PseudoElement - Sendable Conformance` {
    @Test func `pseudo elements are sendable`() async {
        let before = Before()

        await Task {
            #expect(before.description == "::before")
        }.value
    }
}

// MARK: - Usage in Context

@Suite
struct `PseudoElement - CSS Rule Usage` {
    @Test func `before in css rule`() {
        let rule = "p\(Before()) { content: '★'; }"
        #expect(rule == "p::before { content: '★'; }")
    }

    @Test func `after in css rule`() {
        let rule = "blockquote\(After()) { content: close-quote; }"
        #expect(rule == "blockquote::after { content: close-quote; }")
    }

    @Test func `first line in css rule`() {
        let rule = "p\(FirstLine()) { text-transform: uppercase; }"
        #expect(rule == "p::first-line { text-transform: uppercase; }")
    }

    @Test func `first letter in css rule`() {
        let rule = "p\(FirstLetter()) { font-size: 2em; }"
        #expect(rule == "p::first-letter { font-size: 2em; }")
    }

    @Test func `selection in css rule`() {
        let rule = "\(Selection()) { background: highlight; }"
        #expect(rule == "::selection { background: highlight; }")
    }

    @Test func `placeholder in css rule`() {
        let rule = "input\(Placeholder()) { color: gray; }"
        #expect(rule == "input::placeholder { color: gray; }")
    }

    @Test func `marker in css rule`() {
        let rule = "li\(Marker()) { color: red; }"
        #expect(rule == "li::marker { color: red; }")
    }

    @Test func `part in css rule`() {
        let rule = "custom-element\(Part("button")) { background: blue; }"
        #expect(rule == "custom-element::part(button) { background: blue; }")
    }

    @Test func `slotted in css rule`() {
        let rule = "\(Slotted("div")) { margin: 10px; }"
        #expect(rule == "::slotted(div) { margin: 10px; }")
    }
}

@Suite
struct `PseudoElement - Combined with Pseudo Classes` {
    @Test func `before with hover`() {
        let selector = "a:hover::before"
        #expect(selector == "a:hover::before")
    }

    @Test func `after with first child`() {
        let selector = "li:first-child::after"
        #expect(selector == "li:first-child::after")
    }

    @Test func `marker with nth child`() {
        let selector = "li:nth-child(2)::marker"
        #expect(selector == "li:nth-child(2)::marker")
    }
}

// MARK: - Specificity

@Suite
struct `PseudoElement - Specificity Context` {
    @Test func `pseudo element in compound selector`() {
        let selector = "p.intro::first-letter"
        #expect(selector == "p.intro::first-letter")
    }

    @Test func `pseudo element with id selector`() {
        let selector = "#main::before"
        #expect(selector == "#main::before")
    }

    @Test func `pseudo element with attribute selector`() {
        let selector = "input[type='text']::placeholder"
        #expect(selector == "input[type='text']::placeholder")
    }
}

// MARK: - Browser Vendor Prefixes

@Suite
struct `PseudoElement - Vendor Specific` {
    @Test func `webkit input placeholder`() {
        let placeholder = WebkitInputPlaceholder()
        #expect(placeholder.description == "::-webkit-input-placeholder")
    }

    @Test func `moz placeholder`() {
        let placeholder = MozPlaceholder()
        #expect(placeholder.description == "::-moz-placeholder")
    }

    @Test func `ms input placeholder`() {
        let placeholder = MsInputPlaceholder()
        #expect(placeholder.description == "::-ms-input-placeholder")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `PseudoElement - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `simple pseudo element creation 100K times`() {
            for _ in 0..<100_000 {
                _ = Before()
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `parametric pseudo element creation 100K times`() {
            for i in 0..<100_000 {
                _ = Part("part-\(i)")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `highlight creation 100K times`() {
            for i in 0..<100_000 {
                _ = Highlight("highlight-\(i)")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `slotted creation 50K times`() {
            for _ in 0..<50_000 {
                _ = Slotted("div")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `pseudo element comparison 100K times`() {
            let before1 = Before()
            let before2 = Before()

            for _ in 0..<100_000 {
                _ = before1 == before2
            }
        }
    }
}
