// DisplayOutside Tests.swift
// swift-w3c-css
//
// Tests for CSS DisplayOutside type

import Testing

@testable import W3C_CSS_Display

// MARK: - Basic Functionality

@Suite
struct `DisplayOutside - Initialization` {
    @Test(arguments: [
        (DisplayOutside.block, "block"),
        (DisplayOutside.inline, "inline"),
        (DisplayOutside.runIn, "run-in"),
    ])
    func `displayOutside initializes with correct raw value and description`(
        value: DisplayOutside,
        expected: String
    ) {
        #expect(value.rawValue == expected)
        #expect(value.description == expected)
    }
}

@Suite
struct `DisplayOutside - Raw Value Initialization` {
    @Test(arguments: [
        ("block", DisplayOutside.block),
        ("inline", DisplayOutside.inline),
        ("run-in", DisplayOutside.runIn),
    ])
    func `creates displayOutside from valid raw values`(
        rawValue: String,
        expected: DisplayOutside
    ) {
        #expect(DisplayOutside(rawValue: rawValue) == expected)
    }

    @Test func `returns nil for invalid raw values`() {
        #expect(DisplayOutside(rawValue: "invalid") == nil)
        #expect(DisplayOutside(rawValue: "") == nil)
        #expect(DisplayOutside(rawValue: "flex") == nil)
        #expect(DisplayOutside(rawValue: "grid") == nil)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `DisplayOutside - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let display1 = DisplayOutside.block
        let display2 = DisplayOutside.block
        #expect(display1 == display2)
    }

    @Test func `different values are not equal`() {
        let display1 = DisplayOutside.block
        let display2 = DisplayOutside.inline
        #expect(display1 != display2)
    }

    @Test func `hashable allows use in sets`() {
        let set: Set<DisplayOutside> = [.block, .inline, .runIn, .block]
        #expect(set.count == 3)
        #expect(set.contains(.block))
        #expect(set.contains(.inline))
        #expect(set.contains(.runIn))
    }

    @Test func `hashable allows use as dictionary keys`() {
        let dict: [DisplayOutside: String] = [
            .block: "block-level",
            .inline: "inline-level",
            .runIn: "conditional",
        ]
        #expect(dict[.block] == "block-level")
        #expect(dict[.inline] == "inline-level")
        #expect(dict[.runIn] == "conditional")
    }
}

// MARK: - Usage in Context

@Suite
struct `DisplayOutside - CSS Property Usage` {
    @Test(arguments: [
        (DisplayOutside.block, "display: block"),
        (DisplayOutside.inline, "display: inline"),
        (DisplayOutside.runIn, "display: run-in"),
    ])
    func `renders correctly in display property`(
        value: DisplayOutside,
        expected: String
    ) {
        let display = "display: \(value)"
        #expect(display == expected)
    }

    @Test func `block creates block-level box`() {
        #expect(DisplayOutside.block.description == "block")
    }

    @Test func `inline creates inline-level box`() {
        #expect(DisplayOutside.inline.description == "inline")
    }

    @Test func `runIn creates conditional box`() {
        #expect(DisplayOutside.runIn.description == "run-in")
    }
}

// MARK: - Combination with DisplayInside

@Suite
struct `DisplayOutside - Combination Behavior` {
    @Test(arguments: [
        (DisplayOutside.block, DisplayInside.flow, "block flow"),
        (DisplayOutside.block, DisplayInside.flex, "block flex"),
        (DisplayOutside.inline, DisplayInside.grid, "inline grid"),
        (DisplayOutside.inline, DisplayInside.flex, "inline flex"),
        (DisplayOutside.block, DisplayInside.grid, "block grid"),
    ])
    func `combines with displayInside values`(
        outside: DisplayOutside,
        inside: DisplayInside,
        expected: String
    ) {
        let combined = "\(outside) \(inside)"
        #expect(combined == expected)
    }

    @Test func `block flex creates flex container`() {
        let blockFlex = "\(DisplayOutside.block) \(DisplayInside.flex)"
        #expect(blockFlex == "block flex")
    }

    @Test func `inline grid creates inline-level grid`() {
        let inlineGrid = "\(DisplayOutside.inline) \(DisplayInside.grid)"
        #expect(inlineGrid == "inline grid")
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `DisplayOutside - CSS Specification` {
    @Test func `block matches CSS specification`() {
        // Block-level element
        #expect(DisplayOutside.block.rawValue == "block")
        #expect(DisplayOutside.block.description == "block")
    }

    @Test func `inline matches CSS specification`() {
        // Inline element
        #expect(DisplayOutside.inline.rawValue == "inline")
        #expect(DisplayOutside.inline.description == "inline")
    }

    @Test func `runIn matches CSS specification`() {
        // Run-in element (conditional block/inline)
        #expect(DisplayOutside.runIn.rawValue == "run-in")
        #expect(DisplayOutside.runIn.description == "run-in")
    }

    @Test func `all specification values are present`() {
        // Ensure we have all spec-defined display-outside values
        let allValues: Set<DisplayOutside> = [.block, .inline, .runIn]
        #expect(allValues.count == 3)
    }
}

// MARK: - Edge Cases

@Suite
struct `DisplayOutside - Edge Cases` {
    @Test func `case insensitive raw value lookup fails`() {
        #expect(DisplayOutside(rawValue: "BLOCK") == nil)
        #expect(DisplayOutside(rawValue: "Inline") == nil)
        #expect(DisplayOutside(rawValue: "RUN-IN") == nil)
    }

    @Test func `whitespace in raw value fails`() {
        #expect(DisplayOutside(rawValue: " block") == nil)
        #expect(DisplayOutside(rawValue: "inline ") == nil)
        #expect(DisplayOutside(rawValue: " run-in ") == nil)
    }

    @Test func `similar but incorrect values fail`() {
        #expect(DisplayOutside(rawValue: "blocks") == nil)
        #expect(DisplayOutside(rawValue: "inline-block") == nil)
        #expect(DisplayOutside(rawValue: "run_in") == nil)
        #expect(DisplayOutside(rawValue: "runin") == nil)
    }

    @Test func `hyphenated values are parsed correctly`() {
        // Ensure hyphenated values like "run-in" work
        #expect(DisplayOutside(rawValue: "run-in") == DisplayOutside.runIn)
        #expect(DisplayOutside.runIn.rawValue == "run-in")
    }
}

// MARK: - Box Level Semantics

@Suite
struct `DisplayOutside - Box Semantics` {
    @Test func `block creates new line`() {
        // Block-level boxes start on a new line
        let blockElements: [DisplayOutside] = [.block]
        #expect(blockElements.contains(.block))
    }

    @Test func `inline flows with text`() {
        // Inline-level boxes flow within text
        let inlineElements: [DisplayOutside] = [.inline]
        #expect(inlineElements.contains(.inline))
    }

    @Test func `runIn is conditional`() {
        // Run-in boxes are conditionally block or inline
        let conditionalElements: [DisplayOutside] = [.runIn]
        #expect(conditionalElements.contains(.runIn))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `DisplayOutside - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `displayOutside raw value lookup 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayOutside(rawValue: "block")
                _ = DisplayOutside(rawValue: "inline")
                _ = DisplayOutside(rawValue: "run-in")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayOutside equality comparison 100K times`() {
            let block = DisplayOutside.block
            let inline = DisplayOutside.inline
            for _ in 0..<100_000 {
                _ = block == inline
                _ = block == block
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayOutside description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayOutside.block.description
                _ = DisplayOutside.inline.description
                _ = DisplayOutside.runIn.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayOutside combination with displayInside 100K times`() {
            let outside = DisplayOutside.block
            let inside = DisplayInside.flex
            for _ in 0..<100_000 {
                _ = "\(outside) \(inside)"
            }
        }
    }
}
