// DisplayListitem Tests.swift
// swift-w3c-css
//
// Tests for CSS DisplayListitem type

import Testing

@testable import W3C_CSS_Display

// MARK: - Basic Functionality

@Suite
struct `DisplayListitem - Initialization` {
    @Test(arguments: [
        (DisplayListitem.listItem, "list-item"),
        (DisplayListitem.blockFlowListItem, "block flow list-item"),
        (DisplayListitem.blockFlowRootListItem, "block flow-root list-item"),
        (DisplayListitem.inlineFlowListItem, "inline flow list-item"),
        (DisplayListitem.inlineFlowRootListItem, "inline flow-root list-item"),
    ])
    func `displayListitem initializes with correct raw value and description`(
        value: DisplayListitem,
        expected: String
    ) {
        #expect(value.rawValue == expected)
        #expect(value.description == expected)
    }
}

@Suite
struct `DisplayListitem - Raw Value Initialization` {
    @Test(arguments: [
        ("list-item", DisplayListitem.listItem),
        ("block flow list-item", DisplayListitem.blockFlowListItem),
        ("block flow-root list-item", DisplayListitem.blockFlowRootListItem),
        ("inline flow list-item", DisplayListitem.inlineFlowListItem),
        ("inline flow-root list-item", DisplayListitem.inlineFlowRootListItem),
    ])
    func `creates displayListitem from valid raw values`(
        rawValue: String,
        expected: DisplayListitem
    ) {
        #expect(DisplayListitem(rawValue: rawValue) == expected)
    }

    @Test func `returns nil for invalid raw values`() {
        #expect(DisplayListitem(rawValue: "invalid") == nil)
        #expect(DisplayListitem(rawValue: "") == nil)
        #expect(DisplayListitem(rawValue: "list") == nil)
        #expect(DisplayListitem(rawValue: "block") == nil)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `DisplayListitem - Hashable Conformance` {
    @Test func `equal values are equal`() {
        let display1 = DisplayListitem.listItem
        let display2 = DisplayListitem.listItem
        #expect(display1 == display2)
    }

    @Test func `different values are not equal`() {
        let display1 = DisplayListitem.listItem
        let display2 = DisplayListitem.blockFlowListItem
        #expect(display1 != display2)
    }

    @Test func `hashable allows use in sets`() {
        let set: Set<DisplayListitem> = [
            .listItem, .blockFlowListItem, .inlineFlowListItem, .listItem,
        ]
        #expect(set.count == 3)
        #expect(set.contains(.listItem))
        #expect(set.contains(.blockFlowListItem))
        #expect(set.contains(.inlineFlowListItem))
    }

    @Test func `hashable allows use as dictionary keys`() {
        let dict: [DisplayListitem: String] = [
            .listItem: "simple",
            .blockFlowListItem: "block-level",
            .inlineFlowListItem: "inline-level",
        ]
        #expect(dict[.listItem] == "simple")
        #expect(dict[.blockFlowListItem] == "block-level")
        #expect(dict[.inlineFlowListItem] == "inline-level")
    }
}

// MARK: - Usage in Context

@Suite
struct `DisplayListitem - CSS Property Usage` {
    @Test(arguments: [
        (DisplayListitem.listItem, "display: list-item"),
        (DisplayListitem.blockFlowListItem, "display: block flow list-item"),
        (DisplayListitem.blockFlowRootListItem, "display: block flow-root list-item"),
        (DisplayListitem.inlineFlowListItem, "display: inline flow list-item"),
        (DisplayListitem.inlineFlowRootListItem, "display: inline flow-root list-item"),
    ])
    func `renders correctly in display property`(
        value: DisplayListitem,
        expected: String
    ) {
        let display = "display: \(value)"
        #expect(display == expected)
    }

    @Test func `listItem creates simple list item`() {
        #expect(DisplayListitem.listItem.description == "list-item")
    }

    @Test func `blockFlowListItem creates block-level list item`() {
        #expect(DisplayListitem.blockFlowListItem.description == "block flow list-item")
    }

    @Test func `inlineFlowListItem creates inline-level list item`() {
        #expect(DisplayListitem.inlineFlowListItem.description == "inline flow list-item")
    }
}

// MARK: - Factory Method

@Suite
struct `DisplayListitem - Factory Creation` {
    @Test(arguments: [
        (DisplayOutside.block, DisplayInside.flow, DisplayListitem.blockFlowListItem),
        (DisplayOutside.block, DisplayInside.flowRoot, DisplayListitem.blockFlowRootListItem),
        (DisplayOutside.inline, DisplayInside.flow, DisplayListitem.inlineFlowListItem),
        (DisplayOutside.inline, DisplayInside.flowRoot, DisplayListitem.inlineFlowRootListItem),
    ])
    func `factory creates correct combinations`(
        outer: DisplayOutside,
        inner: DisplayInside,
        expected: DisplayListitem
    ) {
        let result = DisplayListitemFactory.create(outer: outer, inner: inner)
        #expect(result == expected)
    }

    @Test func `block flow factory creates correct value`() {
        let blockFlow = DisplayListitemFactory.create(outer: .block, inner: .flow)
        #expect(blockFlow == DisplayListitem.blockFlowListItem)
        #expect(blockFlow.description == "block flow list-item")
    }

    @Test func `block flowRoot factory creates correct value`() {
        let blockFlowRoot = DisplayListitemFactory.create(outer: .block, inner: .flowRoot)
        #expect(blockFlowRoot == DisplayListitem.blockFlowRootListItem)
        #expect(blockFlowRoot.description == "block flow-root list-item")
    }

    @Test func `inline flow factory creates correct value`() {
        let inlineFlow = DisplayListitemFactory.create(outer: .inline, inner: .flow)
        #expect(inlineFlow == DisplayListitem.inlineFlowListItem)
        #expect(inlineFlow.description == "inline flow list-item")
    }

    @Test func `inline flowRoot factory creates correct value`() {
        let inlineFlowRoot = DisplayListitemFactory.create(outer: .inline, inner: .flowRoot)
        #expect(inlineFlowRoot == DisplayListitem.inlineFlowRootListItem)
        #expect(inlineFlowRoot.description == "inline flow-root list-item")
    }

    @Test func `unsupported combination falls back to listItem`() {
        let unsupported = DisplayListitemFactory.create(outer: .block, inner: .flex)
        #expect(unsupported == DisplayListitem.listItem)
    }

    @Test func `runIn outer falls back to listItem`() {
        let runInFlow = DisplayListitemFactory.create(outer: .runIn, inner: .flow)
        #expect(runInFlow == DisplayListitem.listItem)
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `DisplayListitem - CSS Specification` {
    @Test func `listItem matches CSS specification`() {
        // Simple list item
        #expect(DisplayListitem.listItem.rawValue == "list-item")
        #expect(DisplayListitem.listItem.description == "list-item")
    }

    @Test func `blockFlowListItem matches CSS specification`() {
        // Block flow list item
        #expect(DisplayListitem.blockFlowListItem.rawValue == "block flow list-item")
        #expect(DisplayListitem.blockFlowListItem.description == "block flow list-item")
    }

    @Test func `blockFlowRootListItem matches CSS specification`() {
        // Block flow-root list item
        #expect(DisplayListitem.blockFlowRootListItem.rawValue == "block flow-root list-item")
        #expect(DisplayListitem.blockFlowRootListItem.description == "block flow-root list-item")
    }

    @Test func `inlineFlowListItem matches CSS specification`() {
        // Inline flow list item
        #expect(DisplayListitem.inlineFlowListItem.rawValue == "inline flow list-item")
        #expect(DisplayListitem.inlineFlowListItem.description == "inline flow list-item")
    }

    @Test func `inlineFlowRootListItem matches CSS specification`() {
        // Inline flow-root list item
        #expect(DisplayListitem.inlineFlowRootListItem.rawValue == "inline flow-root list-item")
        #expect(DisplayListitem.inlineFlowRootListItem.description == "inline flow-root list-item")
    }

    @Test func `all specification values are present`() {
        // Ensure we have all important spec-defined display-listitem values
        let allValues: Set<DisplayListitem> = [
            .listItem, .blockFlowListItem, .blockFlowRootListItem,
            .inlineFlowListItem, .inlineFlowRootListItem,
        ]
        #expect(allValues.count == 5)
    }
}

// MARK: - Edge Cases

@Suite
struct `DisplayListitem - Edge Cases` {
    @Test func `case insensitive raw value lookup fails`() {
        #expect(DisplayListitem(rawValue: "LIST-ITEM") == nil)
        #expect(DisplayListitem(rawValue: "Block Flow List-Item") == nil)
        #expect(DisplayListitem(rawValue: "INLINE FLOW LIST-ITEM") == nil)
    }

    @Test func `whitespace in raw value fails`() {
        #expect(DisplayListitem(rawValue: " list-item") == nil)
        #expect(DisplayListitem(rawValue: "list-item ") == nil)
        #expect(DisplayListitem(rawValue: "block  flow list-item") == nil)
    }

    @Test func `similar but incorrect values fail`() {
        #expect(DisplayListitem(rawValue: "listitem") == nil)
        #expect(DisplayListitem(rawValue: "list_item") == nil)
        #expect(DisplayListitem(rawValue: "block-flow-list-item") == nil)
        #expect(DisplayListitem(rawValue: "list item") == nil)
    }

    @Test func `multi-word values with spaces are parsed correctly`() {
        #expect(
            DisplayListitem(rawValue: "block flow list-item") == DisplayListitem.blockFlowListItem
        )
        #expect(
            DisplayListitem(rawValue: "inline flow-root list-item")
                == DisplayListitem.inlineFlowRootListItem
        )
    }

    @Test func `missing list-item suffix fails`() {
        #expect(DisplayListitem(rawValue: "block flow") == nil)
        #expect(DisplayListitem(rawValue: "inline flow-root") == nil)
    }
}

// MARK: - Semantic Grouping

@Suite
struct `DisplayListitem - Semantic Categories` {
    @Test func `block-level list items`() {
        let blockLevel: [DisplayListitem] = [
            .blockFlowListItem, .blockFlowRootListItem,
        ]
        for value in blockLevel {
            #expect(value.description.hasPrefix("block"))
        }
    }

    @Test func `inline-level list items`() {
        let inlineLevel: [DisplayListitem] = [
            .inlineFlowListItem, .inlineFlowRootListItem,
        ]
        for value in inlineLevel {
            #expect(value.description.hasPrefix("inline"))
        }
    }

    @Test func `flow-based list items`() {
        let flowBased: [DisplayListitem] = [
            .blockFlowListItem, .inlineFlowListItem,
        ]
        for value in flowBased {
            #expect(value.description.contains("flow"))
            #expect(!value.description.contains("flow-root"))
        }
    }

    @Test func `flow-root-based list items`() {
        let flowRootBased: [DisplayListitem] = [
            .blockFlowRootListItem, .inlineFlowRootListItem,
        ]
        for value in flowRootBased {
            #expect(value.description.contains("flow-root"))
        }
    }

    @Test func `all values end with list-item`() {
        let allValues: [DisplayListitem] = [
            .listItem, .blockFlowListItem, .blockFlowRootListItem,
            .inlineFlowListItem, .inlineFlowRootListItem,
        ]
        for value in allValues {
            #expect(value.description.hasSuffix("list-item"))
        }
    }
}

// MARK: - List Item Marker Behavior

@Suite
struct `DisplayListitem - Marker Semantics` {
    @Test func `all values generate list markers`() {
        // All display-listitem values should generate list markers
        let allValues: [DisplayListitem] = [
            .listItem, .blockFlowListItem, .blockFlowRootListItem,
            .inlineFlowListItem, .inlineFlowRootListItem,
        ]
        for value in allValues {
            #expect(value.description.contains("list-item"))
        }
    }

    @Test func `simple listItem is default`() {
        // listItem is the simplest form
        #expect(DisplayListitem.listItem.description == "list-item")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `DisplayListitem - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `displayListitem raw value lookup 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayListitem(rawValue: "list-item")
                _ = DisplayListitem(rawValue: "block flow list-item")
                _ = DisplayListitem(rawValue: "inline flow-root list-item")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayListitem equality comparison 100K times`() {
            let listItem = DisplayListitem.listItem
            let blockFlow = DisplayListitem.blockFlowListItem
            for _ in 0..<100_000 {
                _ = listItem == blockFlow
                _ = listItem == listItem
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayListitem description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayListitem.listItem.description
                _ = DisplayListitem.blockFlowListItem.description
                _ = DisplayListitem.inlineFlowRootListItem.description
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayListitem factory creation 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayListitemFactory.create(outer: .block, inner: .flow)
                _ = DisplayListitemFactory.create(outer: .inline, inner: .flowRoot)
            }
        }
    }
}
