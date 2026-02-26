// Global Tests.swift
// swift-w3c-css
//
// Tests for CSS Global type

import Testing

@testable import W3C_CSS_Shared

// MARK: - Basic Functionality

@Suite
struct `Global - Enum Cases` {
    @Test(arguments: [
        (Global.inherit, "inherit"),
        (Global.initial, "initial"),
        (Global.revert, "revert"),
        (Global.revertLayer, "revert-layer"),
        (Global.unset, "unset"),
    ])
    func `global enum cases render correctly`(
        global: Global,
        expected: String
    ) {
        #expect(global.description == expected)
    }
}

// MARK: - Protocol Conformance

@Suite
struct `Global - Hashable Conformance` {
    @Test func `equal cases are equal`() {
        let global1 = Global.inherit
        let global2 = Global.inherit
        #expect(global1 == global2)
    }

    @Test func `different cases are not equal`() {
        let global1 = Global.inherit
        let global2 = Global.initial
        #expect(global1 != global2)
    }
}

@Suite
struct `Global - CaseIterable Conformance` {
    @Test func `all cases count is correct`() {
        let allCases = Global.allCases
        #expect(allCases.count == 5)
    }

    @Test func `all cases contains all global values`() {
        let allCases = Global.allCases
        #expect(allCases.contains(.inherit))
        #expect(allCases.contains(.initial))
        #expect(allCases.contains(.revert))
        #expect(allCases.contains(.revertLayer))
        #expect(allCases.contains(.unset))
    }
}

// MARK: - Usage in Context

@Suite
struct `Global - CSS Property Usage` {
    @Test func `inherit renders correctly in any property`() {
        let color = "color: \(Global.inherit)"
        #expect(color == "color: inherit")
    }

    @Test func `initial renders correctly in any property`() {
        let display = "display: \(Global.initial)"
        #expect(display == "display: initial")
    }

    @Test func `revert renders correctly in any property`() {
        let margin = "margin: \(Global.revert)"
        #expect(margin == "margin: revert")
    }

    @Test func `revert-layer renders correctly in any property`() {
        let padding = "padding: \(Global.revertLayer)"
        #expect(padding == "padding: revert-layer")
    }

    @Test func `unset renders correctly in any property`() {
        let fontSize = "font-size: \(Global.unset)"
        #expect(fontSize == "font-size: unset")
    }
}

// MARK: - CSS Specification

@Suite
struct `Global - CSS Specification Compliance` {
    @Test func `inherit inherits from parent element`() {
        #expect(Global.inherit.description == "inherit")
    }

    @Test func `initial uses property initial value`() {
        #expect(Global.initial.description == "initial")
    }

    @Test func `revert rolls back to user agent stylesheet`() {
        #expect(Global.revert.description == "revert")
    }

    @Test func `revert-layer rolls back to previous cascade layer`() {
        #expect(Global.revertLayer.description == "revert-layer")
    }

    @Test func `unset acts as inherit or initial depending on property`() {
        #expect(Global.unset.description == "unset")
    }
}

// MARK: - Edge Cases

@Suite
struct `Global - Edge Cases` {
    @Test func `all global values are distinct`() {
        let allGlobals = Global.allCases
        let uniqueDescriptions = Set(allGlobals.map { $0.description })
        #expect(uniqueDescriptions.count == allGlobals.count)
    }

    @Test func `revert-layer uses hyphenated format`() {
        #expect(Global.revertLayer.description == "revert-layer")
        #expect(!Global.revertLayer.description.contains("_"))
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `Global - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `global case access 100K times`() {
            for _ in 0..<100_000 {
                _ = Global.inherit
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `global case iteration 10K times`() {
            for _ in 0..<10_000 {
                for global in Global.allCases {
                    _ = global.description
                }
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `global comparison 100K times`() {
            let global1 = Global.inherit
            for _ in 0..<100_000 {
                _ = Global.initial == global1
            }
        }
    }
}
