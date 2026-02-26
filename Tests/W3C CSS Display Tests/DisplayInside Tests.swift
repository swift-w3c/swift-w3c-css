// DisplayInside Tests.swift
// swift-w3c-css
//
// Tests for CSS DisplayInside type

import Testing

@testable import W3C_CSS_Display

// MARK: - Basic Functionality

@Suite
struct `DisplayInside - Initialization` {
    @Test(arguments: [
        (DisplayInside.flow, "flow"),
        (DisplayInside.flowRoot, "flow-root"),
        (DisplayInside.table, "table"),
        (DisplayInside.flex, "flex"),
        (DisplayInside.grid, "grid"),
        (DisplayInside.ruby, "ruby"),
    ])
    func `displayInside initializes with correct raw value and description`(
        value: DisplayInside,
        expected: String
    ) {
        #expect(value.rawValue == expected)
        #expect(value.description == expected)
    }
}

@Suite
struct `DisplayInside - Raw Value Initialization` {
    @Test(arguments: [
        ("flow", DisplayInside.flow),
        ("flow-root", DisplayInside.flowRoot),
        ("table", DisplayInside.table),
        ("flex", DisplayInside.flex),
        ("grid", DisplayInside.grid),
        ("ruby", DisplayInside.ruby),
    ])
    func `creates displayInside from valid raw values`(
        rawValue: String,
        expected: DisplayInside
    ) {
        #expect(DisplayInside(rawValue: rawValue) == expected)
    }

    @Test func `returns nil for invalid raw values`() {
        #expect(DisplayInside(rawValue: "invalid") == nil)
        #expect(DisplayInside(rawValue: "") == nil)
        #expect(DisplayInside(rawValue: "block") == nil)
        #expect(DisplayInside(rawValue: "inline") == nil)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `DisplayInside - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let display1 = DisplayInside.flex
        let display2 = DisplayInside.flex
        #expect(display1 == display2)
    }

    @Test func `different values are not equal`() {
        let display1 = DisplayInside.flex
        let display2 = DisplayInside.grid
        #expect(display1 != display2)
    }

    @Test func `hashable allows use in sets`() {
        let set: Set<DisplayInside> = [.flow, .flex, .grid, .flex]
        #expect(set.count == 3)
        #expect(set.contains(.flow))
        #expect(set.contains(.flex))
        #expect(set.contains(.grid))
    }

    @Test func `hashable allows use as dictionary keys`() {
        let dict: [DisplayInside: String] = [
            .flex: "flexbox",
            .grid: "css-grid",
            .table: "table-layout",
        ]
        #expect(dict[.flex] == "flexbox")
        #expect(dict[.grid] == "css-grid")
        #expect(dict[.table] == "table-layout")
    }
}

// MARK: - Usage in Context

@Suite
struct `DisplayInside - CSS Property Usage` {
    @Test(arguments: [
        (DisplayInside.flow, "display: flow"),
        (DisplayInside.flowRoot, "display: flow-root"),
        (DisplayInside.table, "display: table"),
        (DisplayInside.flex, "display: flex"),
        (DisplayInside.grid, "display: grid"),
        (DisplayInside.ruby, "display: ruby"),
    ])
    func `renders correctly in display property`(
        value: DisplayInside,
        expected: String
    ) {
        let display = "display: \(value)"
        #expect(display == expected)
    }

    @Test func `flow represents standard layout`() {
        #expect(DisplayInside.flow.description == "flow")
    }

    @Test func `flowRoot creates block formatting context`() {
        #expect(DisplayInside.flowRoot.description == "flow-root")
    }

    @Test func `modern layout methods are present`() {
        // Verify modern layout methods exist
        #expect(DisplayInside.flex.description == "flex")
        #expect(DisplayInside.grid.description == "grid")
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `DisplayInside - CSS Specification` {
    @Test func `flow matches CSS specification`() {
        // Standard block and inline layout
        #expect(DisplayInside.flow.rawValue == "flow")
        #expect(DisplayInside.flow.description == "flow")
    }

    @Test func `flowRoot matches CSS specification`() {
        // Block formatting context
        #expect(DisplayInside.flowRoot.rawValue == "flow-root")
        #expect(DisplayInside.flowRoot.description == "flow-root")
    }

    @Test func `table matches CSS specification`() {
        // Table layout
        #expect(DisplayInside.table.rawValue == "table")
        #expect(DisplayInside.table.description == "table")
    }

    @Test func `flex matches CSS specification`() {
        // Flex layout
        #expect(DisplayInside.flex.rawValue == "flex")
        #expect(DisplayInside.flex.description == "flex")
    }

    @Test func `grid matches CSS specification`() {
        // Grid layout
        #expect(DisplayInside.grid.rawValue == "grid")
        #expect(DisplayInside.grid.description == "grid")
    }

    @Test func `ruby matches CSS specification`() {
        // Ruby layout for East Asian typography
        #expect(DisplayInside.ruby.rawValue == "ruby")
        #expect(DisplayInside.ruby.description == "ruby")
    }

    @Test func `all specification values are present`() {
        // Ensure we have all important spec-defined display-inside values
        let allValues: Set<DisplayInside> = [
            .flow, .flowRoot, .table, .flex, .grid, .ruby,
        ]
        #expect(allValues.count == 6)
    }
}

// MARK: - Edge Cases

@Suite
struct `DisplayInside - Edge Cases` {
    @Test func `case insensitive raw value lookup fails`() {
        #expect(DisplayInside(rawValue: "FLEX") == nil)
        #expect(DisplayInside(rawValue: "Grid") == nil)
        #expect(DisplayInside(rawValue: "FLOW-ROOT") == nil)
    }

    @Test func `whitespace in raw value fails`() {
        #expect(DisplayInside(rawValue: " flex") == nil)
        #expect(DisplayInside(rawValue: "grid ") == nil)
        #expect(DisplayInside(rawValue: " flow ") == nil)
    }

    @Test func `similar but incorrect values fail`() {
        #expect(DisplayInside(rawValue: "flexbox") == nil)
        #expect(DisplayInside(rawValue: "css-grid") == nil)
        #expect(DisplayInside(rawValue: "flow_root") == nil)
        #expect(DisplayInside(rawValue: "flowroot") == nil)
    }

    @Test func `hyphenated values are parsed correctly`() {
        // Ensure hyphenated values like "flow-root" work
        #expect(DisplayInside(rawValue: "flow-root") == DisplayInside.flowRoot)
        #expect(DisplayInside.flowRoot.rawValue == "flow-root")
    }
}

// MARK: - Layout Method Categories

@Suite
struct `DisplayInside - Layout Categories` {
    @Test func `traditional flow layouts`() {
        let flowLayouts: [DisplayInside] = [.flow, .flowRoot]
        for layout in flowLayouts {
            #expect(layout.description.contains("flow"))
        }
    }

    @Test func `modern layout methods`() {
        let modernLayouts: [DisplayInside] = [.flex, .grid]
        #expect(modernLayouts.contains(.flex))
        #expect(modernLayouts.contains(.grid))
    }

    @Test func `specialized layout methods`() {
        let specialized: [DisplayInside] = [.table, .ruby]
        #expect(specialized.contains(.table))
        #expect(specialized.contains(.ruby))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `DisplayInside - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `displayInside raw value lookup 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayInside(rawValue: "flex")
                _ = DisplayInside(rawValue: "grid")
                _ = DisplayInside(rawValue: "flow-root")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayInside equality comparison 100K times`() {
            let flex = DisplayInside.flex
            let grid = DisplayInside.grid
            for _ in 0..<100_000 {
                _ = flex == grid
                _ = flex == flex
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayInside description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayInside.flex.description
                _ = DisplayInside.grid.description
                _ = DisplayInside.flowRoot.description
            }
        }
    }
}
