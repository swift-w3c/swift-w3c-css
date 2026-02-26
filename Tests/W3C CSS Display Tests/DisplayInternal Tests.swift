// DisplayInternal Tests.swift
// swift-w3c-css
//
// Tests for CSS DisplayInternal type

import Testing

@testable import W3C_CSS_Display

// MARK: - Basic Functionality

@Suite
struct `DisplayInternal - Table Values Initialization` {
    @Test(arguments: [
        (DisplayInternal.tableRowGroup, "table-row-group"),
        (DisplayInternal.tableHeaderGroup, "table-header-group"),
        (DisplayInternal.tableFooterGroup, "table-footer-group"),
        (DisplayInternal.tableRow, "table-row"),
        (DisplayInternal.tableCell, "table-cell"),
        (DisplayInternal.tableColumnGroup, "table-column-group"),
        (DisplayInternal.tableColumn, "table-column"),
        (DisplayInternal.tableCaption, "table-caption"),
    ])
    func `table-related values initialize correctly`(
        value: DisplayInternal,
        expected: String
    ) {
        #expect(value.rawValue == expected)
        #expect(value.description == expected)
    }
}

@Suite
struct `DisplayInternal - Ruby Values Initialization` {
    @Test(arguments: [
        (DisplayInternal.rubyBase, "ruby-base"),
        (DisplayInternal.rubyText, "ruby-text"),
        (DisplayInternal.rubyBaseContainer, "ruby-base-container"),
        (DisplayInternal.rubyTextContainer, "ruby-text-container"),
    ])
    func `ruby-related values initialize correctly`(
        value: DisplayInternal,
        expected: String
    ) {
        #expect(value.rawValue == expected)
        #expect(value.description == expected)
    }
}

// MARK: - Raw Value Initialization

@Suite
struct `DisplayInternal - Table Raw Value Initialization` {
    @Test(arguments: [
        ("table-row-group", DisplayInternal.tableRowGroup),
        ("table-header-group", DisplayInternal.tableHeaderGroup),
        ("table-footer-group", DisplayInternal.tableFooterGroup),
        ("table-row", DisplayInternal.tableRow),
        ("table-cell", DisplayInternal.tableCell),
        ("table-column-group", DisplayInternal.tableColumnGroup),
        ("table-column", DisplayInternal.tableColumn),
        ("table-caption", DisplayInternal.tableCaption),
    ])
    func `creates displayInternal from valid table raw values`(
        rawValue: String,
        expected: DisplayInternal
    ) {
        #expect(DisplayInternal(rawValue: rawValue) == expected)
    }
}

@Suite
struct `DisplayInternal - Ruby Raw Value Initialization` {
    @Test(arguments: [
        ("ruby-base", DisplayInternal.rubyBase),
        ("ruby-text", DisplayInternal.rubyText),
        ("ruby-base-container", DisplayInternal.rubyBaseContainer),
        ("ruby-text-container", DisplayInternal.rubyTextContainer),
    ])
    func `creates displayInternal from valid ruby raw values`(
        rawValue: String,
        expected: DisplayInternal
    ) {
        #expect(DisplayInternal(rawValue: rawValue) == expected)
    }

    @Test func `returns nil for invalid raw values`() {
        #expect(DisplayInternal(rawValue: "invalid") == nil)
        #expect(DisplayInternal(rawValue: "") == nil)
        #expect(DisplayInternal(rawValue: "block") == nil)
        #expect(DisplayInternal(rawValue: "table") == nil)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `DisplayInternal - Hashable Conformance` {
    @Test func `equal table values are equal`() {
        let display1 = DisplayInternal.tableCell
        let display2 = DisplayInternal.tableCell
        #expect(display1 == display2)
    }

    @Test func `different table values are not equal`() {
        let display1 = DisplayInternal.tableCell
        let display2 = DisplayInternal.tableRow
        #expect(display1 != display2)
    }

    @Test func `table and ruby values are not equal`() {
        let tableValue = DisplayInternal.tableCell
        let rubyValue = DisplayInternal.rubyText
        #expect(tableValue != rubyValue)
    }

    @Test func `hashable allows use in sets`() {
        let set: Set<DisplayInternal> = [
            .tableRow, .tableCell, .rubyText, .tableRow,
        ]
        #expect(set.count == 3)
        #expect(set.contains(.tableRow))
        #expect(set.contains(.tableCell))
        #expect(set.contains(.rubyText))
    }

    @Test func `hashable allows use as dictionary keys`() {
        let dict: [DisplayInternal: String] = [
            .tableRow: "tr",
            .tableCell: "td",
            .rubyText: "rt",
        ]
        #expect(dict[.tableRow] == "tr")
        #expect(dict[.tableCell] == "td")
        #expect(dict[.rubyText] == "rt")
    }
}

// MARK: - Usage in Context

@Suite
struct `DisplayInternal - Table CSS Usage` {
    @Test(arguments: [
        (DisplayInternal.tableRowGroup, "display: table-row-group"),
        (DisplayInternal.tableHeaderGroup, "display: table-header-group"),
        (DisplayInternal.tableFooterGroup, "display: table-footer-group"),
        (DisplayInternal.tableRow, "display: table-row"),
        (DisplayInternal.tableCell, "display: table-cell"),
        (DisplayInternal.tableColumnGroup, "display: table-column-group"),
        (DisplayInternal.tableColumn, "display: table-column"),
        (DisplayInternal.tableCaption, "display: table-caption"),
    ])
    func `table values render correctly in display property`(
        value: DisplayInternal,
        expected: String
    ) {
        let display = "display: \(value)"
        #expect(display == expected)
    }
}

@Suite
struct `DisplayInternal - Ruby CSS Usage` {
    @Test(arguments: [
        (DisplayInternal.rubyBase, "display: ruby-base"),
        (DisplayInternal.rubyText, "display: ruby-text"),
        (DisplayInternal.rubyBaseContainer, "display: ruby-base-container"),
        (DisplayInternal.rubyTextContainer, "display: ruby-text-container"),
    ])
    func `ruby values render correctly in display property`(
        value: DisplayInternal,
        expected: String
    ) {
        let display = "display: \(value)"
        #expect(display == expected)
    }
}

// MARK: - CSS Specification Compliance

@Suite
struct `DisplayInternal - Table Specification` {
    @Test func `tableRowGroup mimics tbody element`() {
        #expect(DisplayInternal.tableRowGroup.rawValue == "table-row-group")
        #expect(DisplayInternal.tableRowGroup.description == "table-row-group")
    }

    @Test func `tableHeaderGroup mimics thead element`() {
        #expect(DisplayInternal.tableHeaderGroup.rawValue == "table-header-group")
        #expect(DisplayInternal.tableHeaderGroup.description == "table-header-group")
    }

    @Test func `tableFooterGroup mimics tfoot element`() {
        #expect(DisplayInternal.tableFooterGroup.rawValue == "table-footer-group")
        #expect(DisplayInternal.tableFooterGroup.description == "table-footer-group")
    }

    @Test func `tableRow mimics tr element`() {
        #expect(DisplayInternal.tableRow.rawValue == "table-row")
        #expect(DisplayInternal.tableRow.description == "table-row")
    }

    @Test func `tableCell mimics td element`() {
        #expect(DisplayInternal.tableCell.rawValue == "table-cell")
        #expect(DisplayInternal.tableCell.description == "table-cell")
    }

    @Test func `tableColumnGroup mimics colgroup element`() {
        #expect(DisplayInternal.tableColumnGroup.rawValue == "table-column-group")
        #expect(DisplayInternal.tableColumnGroup.description == "table-column-group")
    }

    @Test func `tableColumn mimics col element`() {
        #expect(DisplayInternal.tableColumn.rawValue == "table-column")
        #expect(DisplayInternal.tableColumn.description == "table-column")
    }

    @Test func `tableCaption mimics caption element`() {
        #expect(DisplayInternal.tableCaption.rawValue == "table-caption")
        #expect(DisplayInternal.tableCaption.description == "table-caption")
    }
}

@Suite
struct `DisplayInternal - Ruby Specification` {
    @Test func `rubyBase mimics rb element`() {
        #expect(DisplayInternal.rubyBase.rawValue == "ruby-base")
        #expect(DisplayInternal.rubyBase.description == "ruby-base")
    }

    @Test func `rubyText mimics rt element`() {
        #expect(DisplayInternal.rubyText.rawValue == "ruby-text")
        #expect(DisplayInternal.rubyText.description == "ruby-text")
    }

    @Test func `rubyBaseContainer for base grouping`() {
        #expect(DisplayInternal.rubyBaseContainer.rawValue == "ruby-base-container")
        #expect(DisplayInternal.rubyBaseContainer.description == "ruby-base-container")
    }

    @Test func `rubyTextContainer mimics rtc element`() {
        #expect(DisplayInternal.rubyTextContainer.rawValue == "ruby-text-container")
        #expect(DisplayInternal.rubyTextContainer.description == "ruby-text-container")
    }

    @Test func `all specification values are present`() {
        // Ensure we have all spec-defined display-internal values
        let allValues: Set<DisplayInternal> = [
            .tableRowGroup, .tableHeaderGroup, .tableFooterGroup,
            .tableRow, .tableCell, .tableColumnGroup, .tableColumn,
            .tableCaption, .rubyBase, .rubyText, .rubyBaseContainer,
            .rubyTextContainer,
        ]
        #expect(allValues.count == 12)
    }
}

// MARK: - Edge Cases

@Suite
struct `DisplayInternal - Edge Cases` {
    @Test func `case insensitive raw value lookup fails`() {
        #expect(DisplayInternal(rawValue: "TABLE-ROW") == nil)
        #expect(DisplayInternal(rawValue: "Table-Cell") == nil)
        #expect(DisplayInternal(rawValue: "RUBY-TEXT") == nil)
    }

    @Test func `whitespace in raw value fails`() {
        #expect(DisplayInternal(rawValue: " table-row") == nil)
        #expect(DisplayInternal(rawValue: "table-cell ") == nil)
        #expect(DisplayInternal(rawValue: " ruby-text ") == nil)
    }

    @Test func `similar but incorrect values fail`() {
        #expect(DisplayInternal(rawValue: "tablerow") == nil)
        #expect(DisplayInternal(rawValue: "table_row") == nil)
        #expect(DisplayInternal(rawValue: "ruby_text") == nil)
        #expect(DisplayInternal(rawValue: "rubytext") == nil)
    }

    @Test func `hyphenated values are parsed correctly`() {
        #expect(DisplayInternal(rawValue: "table-row") == DisplayInternal.tableRow)
        #expect(DisplayInternal(rawValue: "ruby-text") == DisplayInternal.rubyText)
        #expect(
            DisplayInternal(rawValue: "ruby-base-container") == DisplayInternal.rubyBaseContainer
        )
    }
}

// MARK: - Semantic Grouping

@Suite
struct `DisplayInternal - Semantic Categories` {
    @Test func `table structure values`() {
        let structuralValues: [DisplayInternal] = [
            .tableRowGroup, .tableHeaderGroup, .tableFooterGroup,
            .tableColumnGroup,
        ]
        #expect(structuralValues.count == 4)
    }

    @Test func `table content values`() {
        let contentValues: [DisplayInternal] = [
            .tableRow, .tableCell, .tableColumn, .tableCaption,
        ]
        #expect(contentValues.count == 4)
    }

    @Test func `ruby base values`() {
        let baseValues: [DisplayInternal] = [
            .rubyBase, .rubyBaseContainer,
        ]
        #expect(baseValues.count == 2)
        for value in baseValues {
            #expect(value.description.contains("ruby-base"))
        }
    }

    @Test func `ruby annotation values`() {
        let annotationValues: [DisplayInternal] = [
            .rubyText, .rubyTextContainer,
        ]
        #expect(annotationValues.count == 2)
        for value in annotationValues {
            #expect(value.description.contains("ruby-text"))
        }
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `DisplayInternal - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `displayInternal raw value lookup 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayInternal(rawValue: "table-row")
                _ = DisplayInternal(rawValue: "table-cell")
                _ = DisplayInternal(rawValue: "ruby-text")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayInternal equality comparison 100K times`() {
            let tableRow = DisplayInternal.tableRow
            let tableCell = DisplayInternal.tableCell
            for _ in 0..<100_000 {
                _ = tableRow == tableCell
                _ = tableRow == tableRow
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `displayInternal description generation 100K times`() {
            for _ in 0..<100_000 {
                _ = DisplayInternal.tableRow.description
                _ = DisplayInternal.tableCell.description
                _ = DisplayInternal.rubyText.description
            }
        }
    }
}
