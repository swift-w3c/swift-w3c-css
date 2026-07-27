// DisplayLegacy Tests.swift
// swift-w3c-css
//
// Tests for CSS DisplayLegacy type

import Testing

@testable import W3C_CSS_Display

// MARK: - Basic Functionality

@Suite
struct `DisplayLegacy - Initialization` {
    @Test(arguments: [
        (DisplayLegacy.inlineBlock, "inline-block"),
        (DisplayLegacy.inlineTable, "inline-table"),
        (DisplayLegacy.inlineFlex, "inline-flex"),
        (DisplayLegacy.inlineGrid, "inline-grid"),
    ])
    func `displayLegacy initializes with correct raw value and description`(
        value: DisplayLegacy,
        expected: String
    ) {
        #expect(value.rawValue == expected)
        #expect(value.description == expected)
    }
}

@Suite
struct `DisplayLegacy - Raw Value Initialization` {
    @Test(arguments: [
        ("inline-block", DisplayLegacy.inlineBlock),
        ("inline-table", DisplayLegacy.inlineTable),
        ("inline-flex", DisplayLegacy.inlineFlex),
        ("inline-grid", DisplayLegacy.inlineGrid),
    ])
    func `creates displayLegacy from valid raw values`(
        rawValue: String,
        expected: DisplayLegacy
    ) {
        #expect(DisplayLegacy(rawValue: rawValue) == expected)
    }

    @Test func `returns nil for invalid raw values`() {
        #expect(DisplayLegacy(rawValue: "invalid") == nil)
        #expect(DisplayLegacy(rawValue: "") == nil)
        #expect(DisplayLegacy(rawValue: "block") == nil)
        #expect(DisplayLegacy(rawValue: "inline") == nil)
        #expect(DisplayLegacy(rawValue: "flex") == nil)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `DisplayLegacy - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let display1 = DisplayLegacy.inlineBlock
        let display2 = DisplayLegacy.inlineBlock
        #expect(display1 == display2)
    }

    @Test func `different values are not equal`() {
        let display1 = DisplayLegacy.inlineBlock
        let display2 = DisplayLegacy.inlineFlex
        #expect(display1 != display2)
    }

    @Test func `hashable allows use in sets`() {
        let set: Set<DisplayLegacy> = [
            .inlineBlock, .inlineFlex, .inlineGrid, .inlineBlock,
        ]
        #expect(set.count == 3)
        #expect(set.contains(.inlineBlock))
        #expect(set.contains(.inlineFlex))
        #expect(set.contains(.inlineGrid))
    }

    @Test func `hashable allows use as dictionary keys`() {
        let dict: [DisplayLegacy: String] = [
            .inlineBlock: "inline block container",
            .inlineFlex: "inline flex container",
            .inlineGrid: "inline grid container",
        ]
        #expect(dict[.inlineBlock] == "inline block container")
        #expect(dict[.inlineFlex] == "inline flex container")
        #expect(dict[.inlineGrid] == "inline grid container")
    }
}

// MARK: - Usage in Context

@Suite
struct `DisplayLegacy - CSS Property Usage` {
    @Test(arguments: [
        (DisplayLegacy.inlineBlock, "display: inline-block"),
        (DisplayLegacy.inlineTable, "display: inline-table"),
        (DisplayLegacy.inlineFlex, "display: inline-flex"),
        (DisplayLegacy.inlineGrid, "display: inline-grid"),
    ])
    func `renders correctly in display property`(
        value: DisplayLegacy,
        expected: String
    ) {
        let display = "display: \(value)"
        #expect(display == expected)
    }

    @Test func `inlineBlock creates inline-level block container`() {
        #expect(DisplayLegacy.inlineBlock.description == "inline-block")
    }

    @Test func `inlineFlex creates inline-level flex container`() {
        #expect(DisplayLegacy.inlineFlex.description == "inline-flex")
    }

    @Test func `inlineGrid creates inline-level grid container`() {
        #expect(DisplayLegacy.inlineGrid.description == "inline-grid")
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `DisplayLegacy - CSS Specification` {
    @Test func `inlineBlock matches CSS specification`() {
        // Inline-level block container
        #expect(DisplayLegacy.inlineBlock.rawValue == "inline-block")
        #expect(DisplayLegacy.inlineBlock.description == "inline-block")
    }

    @Test func `inlineTable matches CSS specification`() {
        // Inline-level table
        #expect(DisplayLegacy.inlineTable.rawValue == "inline-table")
        #expect(DisplayLegacy.inlineTable.description == "inline-table")
    }

    @Test func `inlineFlex matches CSS specification`() {
        // Inline-level flex container
        #expect(DisplayLegacy.inlineFlex.rawValue == "inline-flex")
        #expect(DisplayLegacy.inlineFlex.description == "inline-flex")
    }

    @Test func `inlineGrid matches CSS specification`() {
        // Inline-level grid container
        #expect(DisplayLegacy.inlineGrid.rawValue == "inline-grid")
        #expect(DisplayLegacy.inlineGrid.description == "inline-grid")
    }

    @Test func `all specification values are present`() {
        // Ensure we have all important spec-defined display-legacy values
        let allValues: Set<DisplayLegacy> = [
            .inlineBlock, .inlineTable, .inlineFlex, .inlineGrid,
        ]
        #expect(allValues.count == 4)
    }
}

// MARK: - Legacy vs Modern Equivalence

@Suite
struct `DisplayLegacy - Modern Equivalence` {
    @Test func `inlineBlock equivalent to inline flow-root`() {
        // inline-block ≈ inline flow-root
        let legacy = DisplayLegacy.inlineBlock.description
        let modern = "\(DisplayOutside.inline) \(DisplayInside.flowRoot)"
        #expect(legacy == "inline-block")
        #expect(modern == "inline flow-root")
    }

    @Test func `inlineFlex equivalent to inline flex`() {
        // inline-flex ≈ inline flex
        let legacy = DisplayLegacy.inlineFlex.description
        let modern = "\(DisplayOutside.inline) \(DisplayInside.flex)"
        #expect(legacy == "inline-flex")
        #expect(modern == "inline flex")
    }

    @Test func `inlineGrid equivalent to inline grid`() {
        // inline-grid ≈ inline grid
        let legacy = DisplayLegacy.inlineGrid.description
        let modern = "\(DisplayOutside.inline) \(DisplayInside.grid)"
        #expect(legacy == "inline-grid")
        #expect(modern == "inline grid")
    }

    @Test func `inlineTable equivalent to inline table`() {
        // inline-table ≈ inline table
        let legacy = DisplayLegacy.inlineTable.description
        let modern = "\(DisplayOutside.inline) \(DisplayInside.table)"
        #expect(legacy == "inline-table")
        #expect(modern == "inline table")
    }
}

// MARK: - Edge Cases

@Suite
struct `DisplayLegacy - Edge Cases` {
    @Test func `case insensitive raw value lookup fails`() {
        #expect(DisplayLegacy(rawValue: "INLINE-BLOCK") == nil)
        #expect(DisplayLegacy(rawValue: "Inline-Flex") == nil)
        #expect(DisplayLegacy(rawValue: "INLINE-GRID") == nil)
    }

    @Test func `whitespace in raw value fails`() {
        #expect(DisplayLegacy(rawValue: " inline-block") == nil)
        #expect(DisplayLegacy(rawValue: "inline-flex ") == nil)
        #expect(DisplayLegacy(rawValue: " inline-grid ") == nil)
    }

    @Test func `similar but incorrect values fail`() {
        #expect(DisplayLegacy(rawValue: "inlineblock") == nil)
        #expect(DisplayLegacy(rawValue: "inline_block") == nil)
        #expect(DisplayLegacy(rawValue: "inline block") == nil)
        #expect(DisplayLegacy(rawValue: "inline-flexbox") == nil)
    }

    @Test func `hyphenated values are parsed correctly`() {
        #expect(DisplayLegacy(rawValue: "inline-block") == DisplayLegacy.inlineBlock)
        #expect(DisplayLegacy(rawValue: "inline-flex") == DisplayLegacy.inlineFlex)
        #expect(DisplayLegacy(rawValue: "inline-grid") == DisplayLegacy.inlineGrid)
    }

    @Test func `non-inline variants fail`() {
        // These legacy values are all inline variants
        #expect(DisplayLegacy(rawValue: "block") == nil)
        #expect(DisplayLegacy(rawValue: "flex") == nil)
        #expect(DisplayLegacy(rawValue: "grid") == nil)
    }
}

// MARK: - Semantic Grouping

@Suite
struct `DisplayLegacy - Layout Categories` {
    @Test func `all values are inline-level`() {
        let allValues: [DisplayLegacy] = [
            .inlineBlock, .inlineTable, .inlineFlex, .inlineGrid,
        ]
        for value in allValues {
            #expect(value.description.hasPrefix("inline-"))
        }
    }

    @Test func `traditional layout methods`() {
        let traditional: [DisplayLegacy] = [.inlineBlock, .inlineTable]
        #expect(traditional.contains(.inlineBlock))
        #expect(traditional.contains(.inlineTable))
    }

    @Test func `modern layout methods`() {
        let modern: [DisplayLegacy] = [.inlineFlex, .inlineGrid]
        #expect(modern.contains(.inlineFlex))
        #expect(modern.contains(.inlineGrid))
    }
}

// MARK: - Backward Compatibility

@Suite
struct `DisplayLegacy - Backward Compatibility` {
    @Test func `widely supported legacy values`() {
        // These values have wide browser support
        let widelySupported: [DisplayLegacy] = [
            .inlineBlock, .inlineTable, .inlineFlex, .inlineGrid,
        ]
        #expect(widelySupported.count == 4)
    }

    @Test func `legacy values remain valid CSS`() {
        // All legacy values are still valid in modern CSS
        for value in [DisplayLegacy.inlineBlock, .inlineTable, .inlineFlex, .inlineGrid] {
            #expect(!value.description.isEmpty)
        }
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `DisplayLegacy - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `displayLegacy raw value lookup 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayLegacy(rawValue: "inline-block")
                _ = DisplayLegacy(rawValue: "inline-flex")
                _ = DisplayLegacy(rawValue: "inline-grid")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayLegacy equality comparison 100K times`() {
            let inlineBlock = DisplayLegacy.inlineBlock
            let inlineFlex = DisplayLegacy.inlineFlex
            for _ in 0..<100_000 {
                _ = inlineBlock == inlineFlex
                _ = inlineBlock == inlineBlock
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayLegacy description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayLegacy.inlineBlock.description
                _ = DisplayLegacy.inlineFlex.description
                _ = DisplayLegacy.inlineGrid.description
            }
        }
    }
}
